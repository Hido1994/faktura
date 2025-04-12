package at.dhinterndorfer.faktura.paymentmethod;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.PaymentMethodPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.PaymentMethodRestDto;
import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class PaymentMethodController {
    private final PageableMapper pageableMapper;

    private final PaymentMethodService service;
    private final PaymentMethodMapper mapper;


    public PaymentMethodRestDto save(@NonNull PaymentMethodRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public PaymentMethodRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public PaymentMethodPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
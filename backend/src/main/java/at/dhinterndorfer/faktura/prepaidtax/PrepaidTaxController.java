package at.dhinterndorfer.faktura.prepaidtax;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.PrepaidTaxPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.PrepaidTaxRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class PrepaidTaxController {
    private final PageableMapper pageableMapper;

    private final PrepaidTaxService service;
    private final PrepaidTaxMapper mapper;


    public PrepaidTaxRestDto save(@NonNull PrepaidTaxRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public PrepaidTaxRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public PrepaidTaxPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
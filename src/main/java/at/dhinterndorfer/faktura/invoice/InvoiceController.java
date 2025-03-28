package at.dhinterndorfer.faktura.invoice;

import at.dhinterndorfer.faktura.dto.v1.InvoicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.InvoiceRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class InvoiceController {
    private final PageableMapper pageableMapper;

    private final InvoiceService service;
    private final InvoiceMapper mapper;


    public InvoiceRestDto save(@NonNull InvoiceRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public InvoiceRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public InvoicePageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
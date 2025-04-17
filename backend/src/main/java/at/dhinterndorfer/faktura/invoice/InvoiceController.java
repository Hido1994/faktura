package at.dhinterndorfer.faktura.invoice;

import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import at.dhinterndorfer.faktura.dto.v1.InvoiceFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.InvoicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.InvoiceRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
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

    public InvoicePageRestDto findAll(InvoiceFilterRestDto filter, PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(mapper.mapFilter(filter), pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
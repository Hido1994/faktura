package at.dhinterndorfer.faktura.supplier;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.SupplierPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SupplierRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class SupplierController {
    private final PageableMapper pageableMapper;

    private final SupplierService service;
    private final SupplierMapper mapper;


    public SupplierRestDto save(@NonNull SupplierRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public SupplierRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public SupplierPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
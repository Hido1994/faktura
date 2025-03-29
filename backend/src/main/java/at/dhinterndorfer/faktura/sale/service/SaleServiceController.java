package at.dhinterndorfer.faktura.sale.service;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServiceRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class SaleServiceController {
    private final PageableMapper pageableMapper;

    private final SaleServiceService service;
    private final SaleServiceMapper mapper;


    public SaleServiceRestDto save(@NonNull SaleServiceRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public SaleServiceRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public SaleServicePageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
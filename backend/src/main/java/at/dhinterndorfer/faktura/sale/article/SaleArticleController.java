package at.dhinterndorfer.faktura.sale.article;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticlePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticleRestDto;
import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class SaleArticleController {
    private final PageableMapper pageableMapper;

    private final SaleArticleService service;
    private final SaleArticleMapper mapper;


    public SaleArticleRestDto save(@NonNull SaleArticleRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public SaleArticleRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public SaleArticlePageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
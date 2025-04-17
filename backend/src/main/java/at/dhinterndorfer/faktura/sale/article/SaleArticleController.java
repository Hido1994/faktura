package at.dhinterndorfer.faktura.sale.article;

import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticleFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticlePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticleRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class SaleArticleController {
    private final PageableMapper pageableMapper;

    private final SaleArticleService article;
    private final SaleArticleMapper mapper;


    public SaleArticleRestDto save(@NonNull SaleArticleRestDto entity) {
        return mapper.mapToDto(article.save(mapper.mapToDbo(entity)));
    }

    public SaleArticleRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(article.findById(objId));
    }

    public SaleArticlePageRestDto findAll(SaleArticleFilterRestDto filter, PageableRestDto pageable) {
        return mapper.mapPage(article.findAll(mapper.mapFilter(filter), pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        article.delete(objId);
    }
}
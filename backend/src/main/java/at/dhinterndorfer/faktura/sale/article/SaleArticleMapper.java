package at.dhinterndorfer.faktura.sale.article;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.commons.filter.OperatorTupleMapper;
import at.dhinterndorfer.faktura.dto.v1.SaleArticleFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticlePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticleRestDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class, OperatorTupleMapper.class})
public interface SaleArticleMapper {

    @Mapping(target = "invoice.saleArticles", ignore = true)
    @Mapping(target = "invoice.saleServices", ignore = true)
    SaleArticleRestDto mapToDto(SaleArticle entity);

    List<SaleArticleRestDto> mapToDto(List<SaleArticle> entityList);

    @Mapping(target = "invoice.saleArticles", ignore = true)
    @Mapping(target = "invoice.saleServices", ignore = true)
    SaleArticle mapToDbo(SaleArticleRestDto entity);

    List<SaleArticle> mapToDbo(List<SaleArticleRestDto> entityList);

    default SaleArticlePageRestDto mapPage(Page<SaleArticle> page) {
        SaleArticlePageRestDto pageRestDto = new SaleArticlePageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    SaleArticleSearchFilter mapFilter(SaleArticleFilterRestDto entity);

}
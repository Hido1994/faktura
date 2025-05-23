package at.dhinterndorfer.faktura.sale.article;

import at.dhinterndorfer.faktura.dto.v1.SaleArticlePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticleRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper
public interface SaleArticleMapper {

    SaleArticleRestDto mapToDto(SaleArticle entity);

    List<SaleArticleRestDto> mapToDto(List<SaleArticle> entityList);

    SaleArticle mapToDbo(SaleArticleRestDto entity);

    List<SaleArticle> mapToDbo(List<SaleArticleRestDto> entityList);

    default SaleArticlePageRestDto mapPage(Page<SaleArticle> page) {
        SaleArticlePageRestDto pageRestDto = new SaleArticlePageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }
}
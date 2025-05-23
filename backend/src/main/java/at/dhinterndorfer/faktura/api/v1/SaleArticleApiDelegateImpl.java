package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.SaleArticlePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleArticleRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.sale.article.SaleArticleController;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class SaleArticleApiDelegateImpl implements SaleArticleApiDelegate {
    private final SaleArticleController saleArticleController;

    @Override
    public ResponseEntity<Void> deleteSaleArticle(Long id) {
        saleArticleController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<SaleArticleRestDto> getSaleArticleById(Long id) {
        return ResponseEntity.ok(saleArticleController.findById(id));
    }

    @Override
    public ResponseEntity<SaleArticlePageRestDto> getSaleArticles(PageableRestDto pageable) {
        return ResponseEntity.ok(saleArticleController.findAll(pageable));
    }

    @Override
    public ResponseEntity<SaleArticleRestDto> saveSaleArticle(SaleArticleRestDto saleArticleRestDto) {
        return ResponseEntity.ok(saleArticleController.save(saleArticleRestDto));
    }
}

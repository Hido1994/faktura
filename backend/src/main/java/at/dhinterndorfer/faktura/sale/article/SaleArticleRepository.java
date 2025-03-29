package at.dhinterndorfer.faktura.sale.article;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SaleArticleRepository extends JpaRepository<SaleArticle, Long> {
}
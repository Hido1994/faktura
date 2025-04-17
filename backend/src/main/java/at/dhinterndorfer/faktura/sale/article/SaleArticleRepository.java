package at.dhinterndorfer.faktura.sale.article;

import at.dhinterndorfer.faktura.sale.article.QSaleArticle;
import at.dhinterndorfer.faktura.sale.article.SaleArticle;
import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface SaleArticleRepository extends JpaRepository<SaleArticle, Long>, QuerydslPredicateExecutor<SaleArticle> {
    default BooleanBuilder getDefaultFilterClause(@NonNull SaleArticleSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QSaleArticle qEntity = QSaleArticle.saleArticle;
        filter.getDescription().ifPresent(x -> builder.and(qEntity.description.lower().contains(x.toLowerCase())));
        return builder;
    }
}
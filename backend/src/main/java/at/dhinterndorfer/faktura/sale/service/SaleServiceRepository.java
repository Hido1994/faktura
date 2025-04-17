package at.dhinterndorfer.faktura.sale.service;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface SaleServiceRepository extends JpaRepository<SaleService, Long>, QuerydslPredicateExecutor<SaleService> {
    default BooleanBuilder getDefaultFilterClause(@NonNull SaleServiceSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QSaleService qEntity = QSaleService.saleService;
        filter.getDescription().ifPresent(x -> builder.and(qEntity.description.lower().contains(x.toLowerCase())));
        return builder;
    }
}
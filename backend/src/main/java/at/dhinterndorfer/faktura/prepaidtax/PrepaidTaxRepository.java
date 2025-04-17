package at.dhinterndorfer.faktura.prepaidtax;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface PrepaidTaxRepository extends JpaRepository<PrepaidTax, Long>, QuerydslPredicateExecutor<PrepaidTax> {
    default BooleanBuilder getDefaultFilterClause(@NonNull PrepaidTaxSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QPrepaidTax qEntity = QPrepaidTax.prepaidTax;
        filter.getTaxYear().ifPresent(x -> builder.and(qEntity.taxYear.eq(x)));
        return builder;
    }
}
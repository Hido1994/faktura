package at.dhinterndorfer.faktura.prepaidtax;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface PrepaidTaxRepository extends JpaRepository<PrepaidTax, Long>, QuerydslPredicateExecutor<PrepaidTax> {
    default BooleanBuilder getDefaultFilterClause(@NonNull PrepaidTaxSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QPrepaidTax qEntity = QPrepaidTax.prepaidTax;

        if (filter.getTaxYear() != null && !filter.getTaxYear().isEmpty()) {
            filter.getTaxYear().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.taxYear,
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue())));
            });
        }
        return builder;
    }
}
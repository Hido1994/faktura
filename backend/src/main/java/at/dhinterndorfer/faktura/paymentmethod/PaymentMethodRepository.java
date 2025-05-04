package at.dhinterndorfer.faktura.paymentmethod;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long>, QuerydslPredicateExecutor<PaymentMethod> {
    default BooleanBuilder getDefaultFilterClause(@NonNull PaymentMethodSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QPaymentMethod qEntity = QPaymentMethod.paymentMethod;
        if (filter.getDescription() != null && !filter.getDescription().isEmpty()) {
            filter.getDescription().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.description.lower(),
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue().toLowerCase())));
            });
        }
        return builder;
    }
}
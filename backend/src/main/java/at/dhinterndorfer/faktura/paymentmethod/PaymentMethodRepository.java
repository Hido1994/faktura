package at.dhinterndorfer.faktura.paymentmethod;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long>, QuerydslPredicateExecutor<PaymentMethod> {
    default BooleanBuilder getDefaultFilterClause(@NonNull PaymentMethodSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QPaymentMethod qEntity = QPaymentMethod.paymentMethod;
        filter.getDescription().ifPresent(x -> builder.and(qEntity.description.lower().contains(x.toLowerCase())));
        return builder;
    }
}
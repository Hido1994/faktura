package at.dhinterndorfer.faktura.customer;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long>, QuerydslPredicateExecutor<Customer> {
    default BooleanBuilder getDefaultFilterClause(@NonNull CustomerSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QCustomer qEntity = QCustomer.customer;
        if (filter.getName() != null && !filter.getName().isEmpty()) {
            filter.getName().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.name.lower(),
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue().toLowerCase())));
            });
        }
        return builder;
    }
}
package at.dhinterndorfer.faktura.customer;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long>, QuerydslPredicateExecutor<Customer> {
    default BooleanBuilder getDefaultFilterClause(@NonNull CustomerSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QCustomer qEntity = QCustomer.customer;
        filter.getName().ifPresent(x -> builder.and(qEntity.name.lower().contains(x.toLowerCase())));
        return builder;
    }
}
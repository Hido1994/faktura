package at.dhinterndorfer.faktura.supplier;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierRepository extends JpaRepository<Supplier, Long>, QuerydslPredicateExecutor<Supplier> {
    default BooleanBuilder getDefaultFilterClause(@NonNull SupplierSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QSupplier qEntity = QSupplier.supplier;
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
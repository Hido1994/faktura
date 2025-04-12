package at.dhinterndorfer.faktura.supplier;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierRepository extends JpaRepository<Supplier, Long>, QuerydslPredicateExecutor<Supplier> {
    default BooleanBuilder getDefaultFilterClause(@NonNull SupplierSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QSupplier qEntity = QSupplier.supplier;
        filter.getName().ifPresent(x -> builder.and(qEntity.name.lower().contains(x.toLowerCase())));
        return builder;
    }
}
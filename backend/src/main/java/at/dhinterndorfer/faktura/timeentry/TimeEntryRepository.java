package at.dhinterndorfer.faktura.timeentry;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TimeEntryRepository extends JpaRepository<TimeEntry, Long>, QuerydslPredicateExecutor<TimeEntry> {
    default BooleanBuilder getDefaultFilterClause(@NonNull TimeEntrySearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QTimeEntry qEntity = QTimeEntry.timeEntry;
        Optional.ofNullable(filter.getDescription()).ifPresent(x -> builder.and(
            Expressions.booleanOperation(x.getOperator(), qEntity.description,
                x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(x.getValue()))));
        Optional.ofNullable(filter.getSaleServiceId()).ifPresent(x -> builder.and(
            Expressions.booleanOperation(x.getOperator(), qEntity.saleService.id,
                x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(x.getValue()))));
        Optional.ofNullable(filter.getCustomerId()).ifPresent(x -> builder.and(
            Expressions.booleanOperation(x.getOperator(), qEntity.customer.id,
                x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(x.getValue()))));
        return builder;
    }
}
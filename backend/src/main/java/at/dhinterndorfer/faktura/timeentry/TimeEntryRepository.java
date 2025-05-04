package at.dhinterndorfer.faktura.timeentry;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeEntryRepository extends JpaRepository<TimeEntry, Long>, QuerydslPredicateExecutor<TimeEntry> {
    default BooleanBuilder getDefaultFilterClause(@NonNull TimeEntrySearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QTimeEntry qEntity = QTimeEntry.timeEntry;
        if (filter.getDescription() != null && !filter.getDescription().isEmpty()) {
            filter.getDescription().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.description.lower(),
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue().toLowerCase())));
            });
        }
        if (filter.getSaleServiceId() != null && !filter.getSaleServiceId().isEmpty()) {
            filter.getSaleServiceId().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.saleService.id,
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue())));
            });
        }
        if (filter.getCustomerId() != null && !filter.getCustomerId().isEmpty()) {
            filter.getCustomerId().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.customer.id,
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue())));
            });
        }
        if (filter.getStartedOn() != null && !filter.getStartedOn().isEmpty()) {
            filter.getStartedOn().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.startedOn,
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue())));
            });
        }
        return builder;
    }
}
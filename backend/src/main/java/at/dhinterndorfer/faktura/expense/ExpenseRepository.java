package at.dhinterndorfer.faktura.expense;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface ExpenseRepository extends JpaRepository<Expense, Long>, QuerydslPredicateExecutor<Expense> {
    default BooleanBuilder getDefaultFilterClause(@NonNull ExpenseSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QExpense qEntity = QExpense.expense;
        filter.getDescription().ifPresent(x -> builder.and(qEntity.description.lower().contains(x.toLowerCase())));
        return builder;
    }
}
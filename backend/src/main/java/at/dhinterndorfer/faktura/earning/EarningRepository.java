package at.dhinterndorfer.faktura.earning;

import at.dhinterndorfer.faktura.earning.QEarning;
import at.dhinterndorfer.faktura.earning.Earning;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface EarningRepository extends JpaRepository<Earning, Long>, QuerydslPredicateExecutor<Earning> {
    default BooleanBuilder getDefaultFilterClause(@NonNull EarningSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QEarning qEntity = QEarning.earning;

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
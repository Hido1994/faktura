package at.dhinterndorfer.faktura.internationalinfo;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface InternationalInfoRepository extends JpaRepository<InternationalInfo, Long>, QuerydslPredicateExecutor<InternationalInfo> {
    default BooleanBuilder getDefaultFilterClause(@NonNull InternationalInfoSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QInternationalInfo qEntity = QInternationalInfo.internationalInfo;
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
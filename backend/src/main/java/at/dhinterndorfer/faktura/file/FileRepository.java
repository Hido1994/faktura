package at.dhinterndorfer.faktura.file;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface FileRepository extends JpaRepository<File, Long>, QuerydslPredicateExecutor<File> {
    default BooleanBuilder getDefaultFilterClause(@NonNull FileSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QFile qEntity = QFile.file;

        if (filter.getKey() != null && !filter.getKey().isEmpty()) {
            filter.getKey().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.key.lower(),
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue().toLowerCase())));
            });
        }
        return builder;
    }
}
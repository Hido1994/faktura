package at.dhinterndorfer.faktura.setting;

import at.dhinterndorfer.faktura.setting.Setting;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface SettingRepository extends JpaRepository<Setting, Long>, QuerydslPredicateExecutor<Setting> {
    default BooleanBuilder getDefaultFilterClause(@NonNull SettingSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QSetting qEntity = QSetting.setting;

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
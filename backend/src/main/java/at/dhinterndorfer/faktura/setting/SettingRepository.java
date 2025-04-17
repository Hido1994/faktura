package at.dhinterndorfer.faktura.setting;

import at.dhinterndorfer.faktura.setting.Setting;
import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface SettingRepository extends JpaRepository<Setting, Long>, QuerydslPredicateExecutor<Setting> {
    default BooleanBuilder getDefaultFilterClause(@NonNull SettingSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QSetting qEntity = QSetting.setting;
        filter.getKey().ifPresent(x -> builder.and(qEntity.key.lower().contains(x.toLowerCase())));
        return builder;
    }
}
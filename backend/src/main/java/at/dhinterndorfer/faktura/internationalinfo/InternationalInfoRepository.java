package at.dhinterndorfer.faktura.internationalinfo;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface InternationalInfoRepository extends JpaRepository<InternationalInfo, Long>, QuerydslPredicateExecutor<InternationalInfo> {
    default BooleanBuilder getDefaultFilterClause(@NonNull InternationalInfoSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QInternationalInfo qEntity = QInternationalInfo.internationalInfo;
        filter.getDescription().ifPresent(x -> builder.and(qEntity.description.lower().contains(x.toLowerCase())));
        return builder;
    }
}
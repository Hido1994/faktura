package at.dhinterndorfer.faktura.file;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface FileRepository extends JpaRepository<File, Long>, QuerydslPredicateExecutor<File> {
    default BooleanBuilder getDefaultFilterClause(@NonNull FileSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QFile qEntity = QFile.file;
        filter.getKey().ifPresent(x -> builder.and(qEntity.key.lower().contains(x.toLowerCase())));
        return builder;
    }
}
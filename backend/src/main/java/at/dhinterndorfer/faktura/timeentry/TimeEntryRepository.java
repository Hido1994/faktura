package at.dhinterndorfer.faktura.timeentry;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeEntryRepository extends JpaRepository<TimeEntry, Long>, QuerydslPredicateExecutor<TimeEntry> {
    default BooleanBuilder getDefaultFilterClause(@NonNull TimeEntrySearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QTimeEntry qEntity = QTimeEntry.timeEntry;
        filter.getDescription().ifPresent(x -> builder.and(qEntity.description.lower().contains(x.toLowerCase())));
        return builder;
    }
}
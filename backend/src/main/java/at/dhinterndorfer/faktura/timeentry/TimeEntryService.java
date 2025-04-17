package at.dhinterndorfer.faktura.timeentry;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class TimeEntryService {
    private final TimeEntryRepository repository;

    @Transactional
    public TimeEntry save(@NonNull TimeEntry entity) {
        return repository.save(entity);
    }

    @Transactional
    public TimeEntry findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<TimeEntry> findAll(TimeEntrySearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = TimeEntrySearchFilter.builder().build();
        }
        if (pageable == null) {
            pageable = Pageable.unpaged();
        }
        return repository.findAll(repository.getDefaultFilterClause(filter), pageable);
    }

    @Transactional
    public void delete(@NonNull Long objId) {
        repository.deleteById(objId);
    }
}

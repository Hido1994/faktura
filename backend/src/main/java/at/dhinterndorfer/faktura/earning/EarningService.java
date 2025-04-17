package at.dhinterndorfer.faktura.earning;

import at.dhinterndorfer.faktura.earning.Earning;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class EarningService {
    private final EarningRepository repository;

    @Transactional
    public Earning save(@NonNull Earning entity) {
        return repository.save(entity);
    }

    @Transactional
    public Earning findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<Earning> findAll(EarningSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = EarningSearchFilter.builder().build();
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

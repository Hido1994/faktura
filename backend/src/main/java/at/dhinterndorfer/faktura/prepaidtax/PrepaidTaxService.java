package at.dhinterndorfer.faktura.prepaidtax;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class PrepaidTaxService {
    private final PrepaidTaxRepository repository;

    @Transactional
    public PrepaidTax save(@NonNull PrepaidTax entity) {
        return repository.save(entity);
    }

    @Transactional
    public PrepaidTax findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<PrepaidTax> findAll(PrepaidTaxSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = PrepaidTaxSearchFilter.builder().build();
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

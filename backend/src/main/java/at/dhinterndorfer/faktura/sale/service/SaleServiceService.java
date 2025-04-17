package at.dhinterndorfer.faktura.sale.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class SaleServiceService {
    private final SaleServiceRepository repository;

    @Transactional
    public SaleService save(@NonNull SaleService entity) {
        return repository.save(entity);
    }

    @Transactional
    public SaleService findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<SaleService> findAll(SaleServiceSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = SaleServiceSearchFilter.builder().build();
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

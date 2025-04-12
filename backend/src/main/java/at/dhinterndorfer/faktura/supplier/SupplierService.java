package at.dhinterndorfer.faktura.supplier;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class SupplierService {
    private final SupplierRepository repository;

    @Transactional
    public Supplier save(@NonNull Supplier entity) {
        return repository.save(entity);
    }

    @Transactional
    public Supplier findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<Supplier> findAll(SupplierSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = SupplierSearchFilter.builder().build();
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

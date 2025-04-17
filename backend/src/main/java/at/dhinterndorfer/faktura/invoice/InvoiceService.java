package at.dhinterndorfer.faktura.invoice;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class InvoiceService {
    private final InvoiceRepository repository;

    @Transactional
    public Invoice save(@NonNull Invoice entity) {
        return repository.save(entity);
    }

    @Transactional
    public Invoice findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<Invoice> findAll(InvoiceSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = InvoiceSearchFilter.builder().build();
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

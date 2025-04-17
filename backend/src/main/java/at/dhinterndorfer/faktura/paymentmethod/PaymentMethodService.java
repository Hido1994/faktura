package at.dhinterndorfer.faktura.paymentmethod;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class PaymentMethodService {
    private final PaymentMethodRepository repository;

    @Transactional
    public PaymentMethod save(@NonNull PaymentMethod entity) {
        return repository.save(entity);
    }

    @Transactional
    public PaymentMethod findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<PaymentMethod> findAll(PaymentMethodSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = PaymentMethodSearchFilter.builder().build();
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

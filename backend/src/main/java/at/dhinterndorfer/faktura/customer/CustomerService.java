package at.dhinterndorfer.faktura.customer;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class CustomerService {
    private final CustomerRepository repository;

    @Transactional
    public Customer save(@NonNull Customer entity) {
        return repository.save(entity);
    }

    @Transactional
    public Customer findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<Customer> findAll(@NonNull Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Transactional
    public void delete(@NonNull Long objId) {
        repository.deleteById(objId);
    }
}

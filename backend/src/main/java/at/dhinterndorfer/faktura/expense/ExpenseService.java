package at.dhinterndorfer.faktura.expense;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class ExpenseService {
    private final ExpenseRepository repository;

    @Transactional
    public Expense save(@NonNull Expense entity) {
        return repository.save(entity);
    }

    @Transactional
    public Expense findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<Expense> findAll(ExpenseSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = ExpenseSearchFilter.builder().build();
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

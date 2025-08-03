package at.dhinterndorfer.faktura.sale.service;

import at.dhinterndorfer.faktura.timeentry.TimeEntryRepository;
import jakarta.persistence.EntityNotFoundException;
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
    private final TimeEntryRepository timeEntryRepository;

    @Transactional
    public SaleService save(@NonNull SaleService entity) {
        if (entity.getId() != null) {
            SaleService existingEntity = repository.findById(entity.getId())
                .orElseThrow(() -> new EntityNotFoundException("SaleService not found"));

            if (existingEntity.getTimeEntries() != null) {
                existingEntity.getTimeEntries().forEach(entry -> entry.setSaleService(null));
                timeEntryRepository.saveAll(existingEntity.getTimeEntries());
            }
            entity.getTimeEntries().forEach(timeEntry -> {
                timeEntry.setSaleService(entity);
            });
            entity.setTimeEntries(timeEntryRepository.saveAll(entity.getTimeEntries()));
            return repository.save(entity);
        } else {
            SaleService savedEntity = repository.save(entity);
            savedEntity.getTimeEntries().forEach(timeEntry -> {
                timeEntry.setSaleService(savedEntity);
            });
            savedEntity.setTimeEntries(timeEntryRepository.saveAll(entity.getTimeEntries()));
            return savedEntity;
        }
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

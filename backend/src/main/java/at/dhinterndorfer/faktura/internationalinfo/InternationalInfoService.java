package at.dhinterndorfer.faktura.internationalinfo;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class InternationalInfoService {
    private final InternationalInfoRepository repository;

    @Transactional
    public InternationalInfo save(@NonNull InternationalInfo entity) {
        return repository.save(entity);
    }

    @Transactional
    public InternationalInfo findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<InternationalInfo> findAll(InternationalInfoSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = InternationalInfoSearchFilter.builder().build();
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

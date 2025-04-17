package at.dhinterndorfer.faktura.setting;

import at.dhinterndorfer.faktura.setting.Setting;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class SettingService {
    private final SettingRepository repository;

    @Transactional
    public Setting save(@NonNull Setting entity) {
        return repository.save(entity);
    }

    @Transactional
    public Setting findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<Setting> findAll(SettingSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = SettingSearchFilter.builder().build();
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

package at.dhinterndorfer.faktura.sale.article;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class SaleArticleService {
    private final SaleArticleRepository repository;

    @Transactional
    public SaleArticle save(@NonNull SaleArticle entity) {
        return repository.save(entity);
    }

    @Transactional
    public SaleArticle findById(@NonNull Long objId) {
        return repository.findById(objId).orElse(null);
    }

    @Transactional
    public Page<SaleArticle> findAll(SaleArticleSearchFilter filter, Pageable pageable) {
        if (filter == null) {
            filter = SaleArticleSearchFilter.builder().build();
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

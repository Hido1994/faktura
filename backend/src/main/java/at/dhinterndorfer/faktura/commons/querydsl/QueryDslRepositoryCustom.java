package at.dhinterndorfer.faktura.commons.querydsl;

import com.querydsl.core.types.dsl.PathBuilder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.lang.NonNull;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static com.querydsl.core.alias.Alias.alias;

@NoRepositoryBean
public interface QueryDslRepositoryCustom<T, F> {

    Class<T> getEntityClass();

    default T getAlias() {
        return getAlias(getEntityName());
    }

    default T getAlias(String variable) {
        return alias(getEntityClass(), variable);
    }

    default PathBuilder<T> getPathBuilder() {
        return getPathBuilder(getEntityName());
    }

    default String getEntityName() {
        String name = getEntityClass().getSimpleName();
        return Character.toLowerCase(name.charAt(0)) + name.substring(1);
    }

    default PathBuilder<T> getPathBuilder(String variable) {
        return new PathBuilder<>(getEntityClass(), variable);
    }

    @Transactional(readOnly = true)
    Optional<T> findByFilter(@NonNull F filter);

    @Transactional(readOnly = true)
    Page<T> findAllByFilter(@NonNull F filter, @NonNull Pageable pageable);

}
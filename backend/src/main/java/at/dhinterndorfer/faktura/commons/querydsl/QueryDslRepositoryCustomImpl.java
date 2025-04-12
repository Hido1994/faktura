package at.dhinterndorfer.faktura.commons.querydsl;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.PathBuilder;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.NonNull;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static com.querydsl.core.alias.Alias.$;

public abstract class QueryDslRepositoryCustomImpl<T, F> implements QueryDslRepositoryCustom<T, F> {
    @Autowired
    private JPAQueryFactory jpaQueryFactory;

    protected BooleanBuilder getDefaultFilterClause(@NonNull T entityAlias, @NonNull F filter) {
        return new BooleanBuilder();
    }

    @Transactional(readOnly = true)
    @Override
    public Optional<T> findByFilter(@NonNull F filter) {
        T entityAlias = getAlias();

        T result = jpaQueryFactory.selectFrom($(entityAlias))
            .where(getDefaultFilterClause(entityAlias, filter))
            .fetchOne();

        return Optional.ofNullable(result);
    }

    @Transactional(readOnly = true)
    @Override
    public Page<T> findAllByFilter(@NonNull F filter, @NonNull Pageable pageable) {
        PathBuilder<T> entityPath = getPathBuilder();
        T entityAlias = getAlias();

        JPQLQuery<T> query = jpaQueryFactory.selectFrom($(entityAlias))
            .where(getDefaultFilterClause(entityAlias, filter));

        query = QueryDslUtils.applyPagination(pageable, query, entityPath);
        return new PageImpl<>(query.fetch(), pageable, query.fetchCount());
    }

}

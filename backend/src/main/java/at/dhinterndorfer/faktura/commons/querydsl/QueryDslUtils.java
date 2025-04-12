package at.dhinterndorfer.faktura.commons.querydsl;

import com.querydsl.core.types.Expression;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.OrderSpecifier.NullHandling;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.PathBuilder;
import com.querydsl.jpa.JPQLQuery;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mapping.PropertyPath;
import org.springframework.data.querydsl.QSort;
import org.springframework.lang.NonNull;

import java.util.List;
import java.util.stream.Collectors;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public abstract class QueryDslUtils {

    public static <T> JPQLQuery<T> applyPagination(@NonNull Pageable pageable, @NonNull JPQLQuery<T> query, @NonNull PathBuilder<T> builder) {
        query = applySorting(pageable.getSort(), query, builder);
        return (pageable.isPaged()) ? query.offset(pageable.getOffset()).limit(pageable.getPageSize()) : query;
    }

    public static <T> JPQLQuery<T> applySorting(@NonNull Sort sort, @NonNull JPQLQuery<T> query,
                                                @NonNull PathBuilder<T> builder) {
        if (sort.isUnsorted()) {
            return query;
        }

        if (sort instanceof QSort) {
            return applySorting((QSort) sort, query);
        }

        toOrderSpecifier(sort, builder).forEach(query::orderBy);
        return query;
    }

    public static <T> JPQLQuery<T> applySorting(@NonNull QSort sort, @NonNull JPQLQuery<T> query) {
        if (sort.isUnsorted()) {
            return query;
        }

        return query.orderBy(sort.getOrderSpecifiers().toArray(new OrderSpecifier[0]));
    }

    protected static List<OrderSpecifier<?>> toOrderSpecifier(@NonNull Sort sort, @NonNull PathBuilder<?> builder) {
        return sort.stream()
            .map(x -> toOrderSpecifier(x, builder))
            .collect(Collectors.toList());
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static OrderSpecifier<?> toOrderSpecifier(@NonNull Order order, @NonNull PathBuilder<?> builder) {
        return new OrderSpecifier(
            order.isAscending() ? com.querydsl.core.types.Order.ASC : com.querydsl.core.types.Order.DESC,
            buildOrderPropertyPath(order, builder),
            toQuerydslNullHandling(order.getNullHandling())
        );
    }

    private static NullHandling toQuerydslNullHandling(@NonNull Sort.NullHandling nullHandling) {
        return switch (nullHandling) {
            case NULLS_FIRST -> NullHandling.NullsFirst;
            case NULLS_LAST -> NullHandling.NullsLast;
            default -> NullHandling.Default;
        };
    }

    private static Expression<?> buildOrderPropertyPath(@NonNull Order order, @NonNull PathBuilder<?> builder) {
        PropertyPath path = PropertyPath.from(order.getProperty(), builder.getType());
        Expression<?> propertyExpression = builder;

        while (path != null) {
            if (!path.hasNext() && order.isIgnoreCase() && String.class.equals(path.getType())) {
                propertyExpression = Expressions.stringPath((Path<?>) propertyExpression, path.getSegment()).lower();
            } else {
                propertyExpression = Expressions.path(path.getType(), (Path<?>) propertyExpression, path.getSegment());
            }

            path = path.next();
        }

        return propertyExpression;
    }

}

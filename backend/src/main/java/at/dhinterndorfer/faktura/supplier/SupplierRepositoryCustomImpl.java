package at.dhinterndorfer.faktura.supplier;

import at.dhinterndorfer.faktura.commons.querydsl.QueryDslRepositoryCustomImpl;
import com.querydsl.core.BooleanBuilder;
import org.springframework.lang.NonNull;

import static com.querydsl.core.alias.Alias.$;

public class SupplierRepositoryCustomImpl extends QueryDslRepositoryCustomImpl<Supplier, SupplierSearchFilter> implements SupplierRepositoryCustom {

    @Override
    public Class<Supplier> getEntityClass() {
        return Supplier.class;
    }

    @Override
    protected BooleanBuilder getDefaultFilterClause(@NonNull Supplier entityAlias,
                                                    @NonNull SupplierSearchFilter filter) {
        BooleanBuilder builder = super.getDefaultFilterClause(entityAlias, filter);
        filter.getName().ifPresent(x -> builder.and($(entityAlias.getName()).lower().contains(x.toLowerCase())));
        return builder;
    }
}

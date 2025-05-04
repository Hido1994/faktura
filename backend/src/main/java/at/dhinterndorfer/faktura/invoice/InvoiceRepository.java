package at.dhinterndorfer.faktura.invoice;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.Expressions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, Long>, QuerydslPredicateExecutor<Invoice> {
    default BooleanBuilder getDefaultFilterClause(@NonNull InvoiceSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QInvoice qEntity = QInvoice.invoice;

        if (filter.getInvoiceNumber() != null && !filter.getInvoiceNumber().isEmpty()) {
            filter.getInvoiceNumber().forEach(x -> {
                builder.and(Expressions.booleanOperation(x.getOperator(), qEntity.invoiceNumber,
                    x.getValue() == null ? Expressions.nullExpression() : Expressions.constant(
                        x.getValue())));
            });
        }
        return builder;
    }
}
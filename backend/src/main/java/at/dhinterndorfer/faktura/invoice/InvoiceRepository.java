package at.dhinterndorfer.faktura.invoice;

import com.querydsl.core.BooleanBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, Long>, QuerydslPredicateExecutor<Invoice> {
    default BooleanBuilder getDefaultFilterClause(@NonNull InvoiceSearchFilter filter) {
        BooleanBuilder builder = new BooleanBuilder();
        QInvoice qEntity = QInvoice.invoice;
        filter.getInvoiceNumber().ifPresent(x -> builder.and(qEntity.invoiceNumber.eq(x)));
        return builder;
    }
}
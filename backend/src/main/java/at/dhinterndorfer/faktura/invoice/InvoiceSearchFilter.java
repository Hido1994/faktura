package at.dhinterndorfer.faktura.invoice;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class InvoiceSearchFilter {

    @Builder.Default
    private Nullable<Long> invoiceNumber = Nullable.undefined();

}

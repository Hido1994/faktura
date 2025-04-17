package at.dhinterndorfer.faktura.sale.service;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class SaleServiceSearchFilter {

    @Builder.Default
    private Nullable<String> description = Nullable.undefined();

}

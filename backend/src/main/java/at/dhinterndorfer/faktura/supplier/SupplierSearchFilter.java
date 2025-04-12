package at.dhinterndorfer.faktura.supplier;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class SupplierSearchFilter {

    @Builder.Default
    private Nullable<String> name = Nullable.undefined();

}

package at.dhinterndorfer.faktura.prepaidtax;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class PrepaidTaxSearchFilter {

    @Builder.Default
    private Nullable<Long> taxYear = Nullable.undefined();

}

package at.dhinterndorfer.faktura.timeentry;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class TimeEntrySearchFilter {

    @Builder.Default
    private Nullable<String> description = Nullable.undefined();

    @Builder.Default
    private Nullable<Long> saleServiceId = Nullable.undefined();

    @Builder.Default
    private Nullable<Long> customerId = Nullable.undefined();

}

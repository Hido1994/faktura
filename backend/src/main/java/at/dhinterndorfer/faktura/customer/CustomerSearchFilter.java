package at.dhinterndorfer.faktura.customer;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class CustomerSearchFilter {

    @Builder.Default
    private Nullable<String> name = Nullable.undefined();

}

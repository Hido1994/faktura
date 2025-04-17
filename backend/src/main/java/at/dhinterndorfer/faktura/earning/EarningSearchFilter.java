package at.dhinterndorfer.faktura.earning;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class EarningSearchFilter {

    @Builder.Default
    private Nullable<String> description = Nullable.undefined();

}

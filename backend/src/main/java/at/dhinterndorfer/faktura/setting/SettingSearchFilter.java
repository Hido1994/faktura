package at.dhinterndorfer.faktura.setting;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class SettingSearchFilter {

    @Builder.Default
    private Nullable<String> key = Nullable.undefined();

}

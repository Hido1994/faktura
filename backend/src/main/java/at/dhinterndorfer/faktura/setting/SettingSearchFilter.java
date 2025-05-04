package at.dhinterndorfer.faktura.setting;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import at.dhinterndorfer.faktura.commons.filter.OperatorTuple;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class SettingSearchFilter {

    private List<OperatorTuple<String>> key;

}

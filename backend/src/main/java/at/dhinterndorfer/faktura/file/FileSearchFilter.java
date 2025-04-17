package at.dhinterndorfer.faktura.file;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class FileSearchFilter {

    @Builder.Default
    private Nullable<String> key = Nullable.undefined();

}

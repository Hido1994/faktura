package at.dhinterndorfer.faktura.expense;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class ExpenseSearchFilter {

    @Builder.Default
    private Nullable<String> description = Nullable.undefined();

}

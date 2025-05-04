package at.dhinterndorfer.faktura.expense;

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
public class ExpenseSearchFilter {

    @Builder.Default
    private List<OperatorTuple<String>> description;

}

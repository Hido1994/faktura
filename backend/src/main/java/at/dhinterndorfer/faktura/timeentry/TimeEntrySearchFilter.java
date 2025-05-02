package at.dhinterndorfer.faktura.timeentry;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import at.dhinterndorfer.faktura.commons.filter.OperatorTuple;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class TimeEntrySearchFilter {

    private OperatorTuple<String> description;

    private OperatorTuple<Long> customerId;

    private OperatorTuple<Long> saleServiceId;

    private OperatorTuple<LocalDateTime> startedOn;
}

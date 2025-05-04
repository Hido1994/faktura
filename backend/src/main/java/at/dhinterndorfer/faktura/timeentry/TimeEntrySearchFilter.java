package at.dhinterndorfer.faktura.timeentry;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import at.dhinterndorfer.faktura.commons.filter.OperatorTuple;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class TimeEntrySearchFilter {

    private List<OperatorTuple<String>> description;

    private List<OperatorTuple<Long>> customerId;

    private List<OperatorTuple<Long>> saleServiceId;

    private List<OperatorTuple<LocalDateTime>> startedOn;
}

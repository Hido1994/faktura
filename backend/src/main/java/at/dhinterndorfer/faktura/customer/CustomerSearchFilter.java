package at.dhinterndorfer.faktura.customer;

import at.dhinterndorfer.faktura.commons.filter.OperatorTuple;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class CustomerSearchFilter {

    private List<OperatorTuple<String>> name;

}

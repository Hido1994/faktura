package at.dhinterndorfer.faktura.sale.service;

import at.dhinterndorfer.faktura.commons.filter.OperatorTuple;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class SaleServiceSearchFilter {

    private List<OperatorTuple<String>> description;

}

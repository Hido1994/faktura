package at.dhinterndorfer.faktura.prepaidtax;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "PREPAIDTAX")
public class PrepaidTax {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tax_year", nullable = false)
    private Long taxYear;

    @Column(name = "quarter", nullable = false)
    private Long quarter;

    @Column(name = "taxaccount_prepaidtax_calc")
    private BigDecimal taxAccountPrepaidTaxCalc;

    @Column(name = "taxaccount_surplus")
    private BigDecimal taxAccountSurplus;

    @Column(name = "cash_transfer")
    private BigDecimal cashTransfer;

    @Column(name = "note", length = 1024)
    private String note;
}
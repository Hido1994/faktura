package at.dhinterndorfer.faktura.prepaidtax;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "PREPAID_TAX")
public class PrepaidTax {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tax_year", nullable = false)
    private Long taxYear;

    @Column(name = "tax_quarter", nullable = false)
    private Long taxQuarter;

    @Column(name = "tax_calculated")
    private BigDecimal taxCalculated;

    @Column(name = "account_surplus")
    private BigDecimal accountSurplus;

    @Column(name = "cash_transfer")
    private BigDecimal cashTransfer;

    @Column(name = "note", length = 1024)
    private String note;
}
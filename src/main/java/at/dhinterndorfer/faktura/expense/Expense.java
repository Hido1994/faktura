package at.dhinterndorfer.faktura.expense;

import at.dhinterndorfer.faktura.account.Account;
import at.dhinterndorfer.faktura.internationalinfo.InternationalInfo;
import at.dhinterndorfer.faktura.meansofpayment.MeansOfPayment;
import at.dhinterndorfer.faktura.supplier.Supplier;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "EXPENSES")
public class Expense {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "incomingon", nullable = false)
    private LocalDate incomingOn;

    @Column(name = "description", nullable = false, length = 1024)
    private String description;

    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private Account account;

    @Column(name = "paidon")
    private LocalDate paidOn;

    @ManyToOne
    @JoinColumn(name = "meansofpayment_id", nullable = false)
    private MeansOfPayment meansOfPayment;

    @ManyToOne
    @JoinColumn(name = "supplier_id", nullable = false)
    private Supplier supplier;

    @Column(name = "price_net", nullable = false)
    private BigDecimal priceNet;

    @Column(name = "price_tax", nullable = false)
    private BigDecimal priceTax;

    @ManyToOne
    @JoinColumn(name = "internationalinfo_id")
    private InternationalInfo internationalInfo;

    @Column(name = "note", length = 1024)
    private String note;

    @Column(name = "depreciationtax_years")
    private Long depreciationTaxYears;
}
package at.dhinterndorfer.faktura.salearticle;

import at.dhinterndorfer.faktura.account.Account;
import at.dhinterndorfer.faktura.bill.Bill;
import at.dhinterndorfer.faktura.customer.Customer;
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
@Table(name = "SALES_ARTICLES")
public class SalesArticle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "description", nullable = false, length = 1024)
    private String description;

    @Column(name = "incomingon", nullable = false)
    private LocalDate incomingOn;

    @ManyToOne
    @JoinColumn(name = "supplier_id", nullable = false)
    private Supplier supplier;

    @ManyToOne
    @JoinColumn(name = "internationalinfo_id")
    private InternationalInfo internationalInfo;

    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private Account account;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @Column(name = "price_net", nullable = false)
    private BigDecimal priceNet;

    @Column(name = "price_tax", nullable = false)
    private BigDecimal priceTax;

    @Column(name = "paidon")
    private LocalDate paidOn;

    @ManyToOne
    @JoinColumn(name = "bill_id")
    private Bill bill;

    @Column(name = "sales_net")
    private BigDecimal salesNet;

    @Column(name = "sales_tax")
    private BigDecimal salesTax;

    @ManyToOne
    @JoinColumn(name = "meansofpayment_id")
    private MeansOfPayment meansOfPayment;

    @Column(name = "info", length = 1024)
    private String info;

    @Column(name = "amount")
    private Long amount;
}
package at.dhinterndorfer.faktura.earning;

import at.dhinterndorfer.faktura.account.Account;
import at.dhinterndorfer.faktura.paymentmethod.PaymentMethod;
import at.dhinterndorfer.faktura.supplier.Supplier;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "EARNINGS")
public class Earning {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "description", nullable = false, length = 1024)
    private String description;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;

    @Column(name = "price_net")
    private BigDecimal priceNet;

    @Column(name = "paid_on")
    private LocalDate paidOn;

    @ManyToOne
    @JoinColumn(name = "payment_method_id")
    private PaymentMethod paymentMethod;

    @ManyToOne
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;

    @Column(name = "note", length = 1024)
    private String note;
}
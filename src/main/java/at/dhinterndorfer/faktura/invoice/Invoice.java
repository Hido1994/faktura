package at.dhinterndorfer.faktura.invoice;

import at.dhinterndorfer.faktura.customer.Customer;
import at.dhinterndorfer.faktura.paymentmethod.PaymentMethod;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "INVOICE")
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "no")
    private Long number;

    @Column(name = "subject", nullable = false, length = 1024)
    private String subject;

    @Column(name = "created_on", nullable = false)
    private LocalDate createdOn;

    @Column(name = "paid_on")
    private LocalDate paidOn;

    @ManyToOne
    @JoinColumn(name = "payment_method_id")
    private PaymentMethod paymentMethod;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(name = "service_period", length = 1024)
    private String servicePeriod;

    @Column(name = "revision", length = 1024)
    private String revision;
}
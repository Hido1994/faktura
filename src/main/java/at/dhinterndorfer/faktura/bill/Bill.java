package at.dhinterndorfer.faktura.bill;

import at.dhinterndorfer.faktura.customer.Customer;
import at.dhinterndorfer.faktura.meansofpayment.MeansOfPayment;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "BILLS")
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "no")
    private Long number;

    @Column(name = "subject", nullable = false, length = 1024)
    private String subject;

    @Column(name = "createdon", nullable = false)
    private LocalDate createdOn;

    @Column(name = "paidon")
    private LocalDate paidOn;

    @ManyToOne
    @JoinColumn(name = "meansofpayment_id")
    private MeansOfPayment meansOfPayment;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(name = "serviceperiod", length = 1024)
    private String servicePeriod;

    @Column(name = "revision", length = 1024)
    private String revision;
}
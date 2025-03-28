package at.dhinterndorfer.faktura.saleservice;

import at.dhinterndorfer.faktura.bill.Bill;
import at.dhinterndorfer.faktura.customer.Customer;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "SALES_SERVICES")
public class SalesService {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(name = "hourlyrate", nullable = false)
    private BigDecimal hourlyRate;

    @Column(name = "supplydate", nullable = false)
    private LocalDate supplyDate;

    @Column(name = "hours", nullable = false)
    private Float hours;

    @Column(name = "description", nullable = false, length = 1024)
    private String description;

    @ManyToOne
    @JoinColumn(name = "bill_id")
    private Bill bill;

    @Column(name = "timeinfo", length = 256)
    private String timeInfo;

    @Column(name = "sales_net")
    private BigDecimal salesNet;
}
package at.dhinterndorfer.faktura.sale.service;

import at.dhinterndorfer.faktura.customer.Customer;
import at.dhinterndorfer.faktura.invoice.Invoice;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "SALES_SERVICES")
public class SaleService {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(name = "hourly_rate", nullable = false)
    private BigDecimal hourlyRate;

    @Column(name = "supplied_on", nullable = false)
    private LocalDate suppliedOn;

    @Column(name = "hours", nullable = false)
    private Float hours;

    @Column(name = "description", nullable = false, length = 1024)
    private String description;

    @ManyToOne
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;

    @Column(name = "time_info", length = 256)
    private String timeInfo;

    @Column(name = "sales_net")
    private BigDecimal salesNet;
}
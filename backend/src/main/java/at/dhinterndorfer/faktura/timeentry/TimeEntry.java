package at.dhinterndorfer.faktura.timeentry;

import at.dhinterndorfer.faktura.customer.Customer;
import at.dhinterndorfer.faktura.sale.service.SaleService;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "TIMETABLE")
public class TimeEntry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(name = "started_on", nullable = false)
    private LocalDateTime startedOn;

    @Column(name = "ended_on")
    private LocalDateTime endedOn;

    @Column(name = "description", nullable = false, length = 1024)
    private String description;

    @ManyToOne
    @JoinColumn(name = "sale_service_id")
    private SaleService saleService;
}
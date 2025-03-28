package at.dhinterndorfer.faktura.customer;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "CUSTOMERS")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "searchname", nullable = false, length = 256)
    private String searchName;

    @Column(name = "name", nullable = false, length = 512)
    private String name;

    @Column(name = "addressline1", nullable = false, length = 512)
    private String addressLine1;

    @Column(name = "addressline2", length = 512)
    private String addressLine2;

    @Column(name = "city", nullable = false, length = 128)
    private String city;

    @Column(name = "postalcode", nullable = false, length = 32)
    private String postalCode;

    @Column(name = "salestaxidentifier", length = 64)
    private String salesTaxIdentifier;

    @Column(name = "email", length = 256)
    private String email;

    @Column(name = "phone", length = 256)
    private String phone;

    @Column(name = "hourlyrate")
    private BigDecimal hourlyRate;

    @Column(name = "countrycode", nullable = false, length = 3)
    private String countryCode;

    @Column(name = "dateofpaymentinfo", length = 1024)
    private String dateOfPaymentInfo;
}
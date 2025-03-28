package at.dhinterndorfer.faktura.internationalinfo;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "INTERNATIONALINFO")
public class InternationalInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "description", length = 256)
    private String description;

    @Column(name = "bill_text", length = 1024)
    private String billText;
}
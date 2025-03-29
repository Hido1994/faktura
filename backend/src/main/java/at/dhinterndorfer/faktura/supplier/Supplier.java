package at.dhinterndorfer.faktura.supplier;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "SUPPLIERS")
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "searchname", nullable = false, length = 512)
    private String searchName;

    @Column(name = "name", nullable = false, length = 512)
    private String name;
}
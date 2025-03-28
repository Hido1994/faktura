package at.dhinterndorfer.faktura.setting;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "SETTINGS")
public class Setting {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "settings_key", nullable = false, length = 64)
    private String settingsKey;

    @Column(name = "settings_value", nullable = false, length = 1024)
    private String settingsValue;
}
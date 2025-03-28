package at.dhinterndorfer.faktura.file;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "FILES")
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "file_key", nullable = false, length = 64)
    private String fileKey;

    @Column(name = "filename", length = 350)
    private String filename;

    @Column(name = "mime_type", length = 350)
    private String mimeType;

    @Column(name = "charset", length = 350)
    private String charset;

    @Column(name = "last_updated_on")
    private LocalDateTime lastUpdatedOn;

    @Lob
    @Column(name = "content")
    private byte[] content;
}
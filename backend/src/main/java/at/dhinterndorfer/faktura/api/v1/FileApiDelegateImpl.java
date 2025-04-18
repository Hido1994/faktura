package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.file.FileController;
import at.dhinterndorfer.faktura.dto.v1.FilePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.FileRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class FileApiDelegateImpl implements FileApiDelegate {
    private final FileController fileController;

    @Override
    public ResponseEntity<Void> deleteFile(Long id) {
        fileController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<FileRestDto> getFileById(Long id) {
        return ResponseEntity.ok(fileController.findById(id));
    }

    @Override
    public ResponseEntity<FilePageRestDto> getFiles(PageableRestDto pageable) {
        return ResponseEntity.ok(fileController.findAll(pageable));
    }

    @Override
    public ResponseEntity<FileRestDto> saveFile(FileRestDto fileRestDto) {
        return ResponseEntity.ok(fileController.save(fileRestDto));
    }
}

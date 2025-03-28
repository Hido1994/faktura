package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.earning.EarningController;
import at.dhinterndorfer.faktura.dto.v1.EarningPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.EarningRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class EarningApiDelegateImpl implements EarningApiDelegate {
    private final EarningController earningController;

    @Override
    public ResponseEntity<Void> deleteEarning(Long id) {
        earningController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<EarningRestDto> getEarningById(Long id) {
        return ResponseEntity.ok(earningController.findById(id));
    }

    @Override
    public ResponseEntity<EarningPageRestDto> getEarnings(PageableRestDto pageable) {
        return ResponseEntity.ok(earningController.findAll(pageable));
    }

    @Override
    public ResponseEntity<EarningRestDto> saveEarning(EarningRestDto earningRestDto) {
        return ResponseEntity.ok(earningController.save(earningRestDto));
    }
}

package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.*;
import at.dhinterndorfer.faktura.prepaidtax.PrepaidTaxController;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class PrepaidTaxApiDelegateImpl implements PrepaidTaxApiDelegate {
    private final PrepaidTaxController prepaidTaxController;

    @Override
    public ResponseEntity<Void> deletePrepaidTax(Long id) {
        prepaidTaxController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<PrepaidTaxRestDto> getPrepaidTaxById(Long id) {
        return ResponseEntity.ok(prepaidTaxController.findById(id));
    }
    
    @Override
    public ResponseEntity<PrepaidTaxPageRestDto> getPrepaidTaxes(PrepaidTaxFilterRequestRestDto prepaidTaxFilterRequestRestDto) {
        return ResponseEntity.ok(prepaidTaxController.findAll(prepaidTaxFilterRequestRestDto.getFilter(),
            prepaidTaxFilterRequestRestDto.getPageable()));
    }

    @Override
    public ResponseEntity<PrepaidTaxRestDto> savePrepaidTax(PrepaidTaxRestDto prepaidTaxRestDto) {
        return ResponseEntity.ok(prepaidTaxController.save(prepaidTaxRestDto));
    }
}

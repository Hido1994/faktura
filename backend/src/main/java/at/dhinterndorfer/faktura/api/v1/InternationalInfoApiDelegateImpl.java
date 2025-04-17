package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.*;
import at.dhinterndorfer.faktura.internationalinfo.InternationalInfoController;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class InternationalInfoApiDelegateImpl implements InternationalInfoApiDelegate {
    private final InternationalInfoController internationalInfoController;

    @Override
    public ResponseEntity<Void> deleteInternationalInfo(Long id) {
        internationalInfoController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<InternationalInfoRestDto> getInternationalInfoById(Long id) {
        return ResponseEntity.ok(internationalInfoController.findById(id));
    }
    
    @Override
    public ResponseEntity<InternationalInfoPageRestDto> getInternationalInfos(InternationalInfoFilterRequestRestDto internationalInfoFilterRequestRestDto) {
        return ResponseEntity.ok(internationalInfoController.findAll(internationalInfoFilterRequestRestDto.getFilter(),
            internationalInfoFilterRequestRestDto.getPageable()));
    }

    @Override
    public ResponseEntity<InternationalInfoRestDto> saveInternationalInfo(InternationalInfoRestDto internationalInfoRestDto) {
        return ResponseEntity.ok(internationalInfoController.save(internationalInfoRestDto));
    }
}

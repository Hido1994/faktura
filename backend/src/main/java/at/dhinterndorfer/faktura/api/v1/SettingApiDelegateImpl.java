package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.dto.v1.*;
import at.dhinterndorfer.faktura.setting.SettingController;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class SettingApiDelegateImpl implements SettingApiDelegate {
    private final SettingController settingController;

    @Override
    public ResponseEntity<Void> deleteSetting(Long id) {
        settingController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<SettingRestDto> getSettingById(Long id) {
        return ResponseEntity.ok(settingController.findById(id));
    }
    
    @Override
    public ResponseEntity<SettingPageRestDto> getSettings(SettingFilterRequestRestDto settingFilterRequestRestDto) {
        return ResponseEntity.ok(settingController.findAll(settingFilterRequestRestDto.getFilter(),
            settingFilterRequestRestDto.getPageable()));
    }

    @Override
    public ResponseEntity<SettingRestDto> saveSetting(SettingRestDto settingRestDto) {
        return ResponseEntity.ok(settingController.save(settingRestDto));
    }
}

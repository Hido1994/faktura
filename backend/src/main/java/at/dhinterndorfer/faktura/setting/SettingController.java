package at.dhinterndorfer.faktura.setting;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.dto.v1.SettingPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SettingRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class SettingController {
    private final PageableMapper pageableMapper;

    private final SettingService service;
    private final SettingMapper mapper;


    public SettingRestDto save(@NonNull SettingRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public SettingRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public SettingPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
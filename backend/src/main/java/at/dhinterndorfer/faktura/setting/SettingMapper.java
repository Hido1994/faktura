package at.dhinterndorfer.faktura.setting;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.dto.v1.SettingFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.SettingPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SettingRestDto;
import at.dhinterndorfer.faktura.setting.Setting;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class})
public interface SettingMapper {

    SettingRestDto mapToDto(Setting entity);

    List<SettingRestDto> mapToDto(List<Setting> entityList);

    Setting mapToDbo(SettingRestDto entity);

    List<Setting> mapToDbo(List<SettingRestDto> entityList);

    default SettingPageRestDto mapPage(Page<Setting> page) {
        SettingPageRestDto pageRestDto = new SettingPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    SettingSearchFilter mapFilter(SettingFilterRestDto entity);

}
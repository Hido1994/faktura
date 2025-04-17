package at.dhinterndorfer.faktura.internationalinfo;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.dto.v1.InternationalInfoFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.InternationalInfoPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.InternationalInfoRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class})
public interface InternationalInfoMapper {

    InternationalInfoRestDto mapToDto(InternationalInfo entity);

    List<InternationalInfoRestDto> mapToDto(List<InternationalInfo> entityList);

    InternationalInfo mapToDbo(InternationalInfoRestDto entity);

    List<InternationalInfo> mapToDbo(List<InternationalInfoRestDto> entityList);

    default InternationalInfoPageRestDto mapPage(Page<InternationalInfo> page) {
        InternationalInfoPageRestDto pageRestDto = new InternationalInfoPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    InternationalInfoSearchFilter mapFilter(InternationalInfoFilterRestDto entity);

}
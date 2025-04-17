package at.dhinterndorfer.faktura.earning;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.dto.v1.EarningFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.EarningPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.EarningRestDto;
import at.dhinterndorfer.faktura.earning.Earning;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class})
public interface EarningMapper {

    EarningRestDto mapToDto(Earning entity);

    List<EarningRestDto> mapToDto(List<Earning> entityList);

    Earning mapToDbo(EarningRestDto entity);

    List<Earning> mapToDbo(List<EarningRestDto> entityList);

    default EarningPageRestDto mapPage(Page<Earning> page) {
        EarningPageRestDto pageRestDto = new EarningPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    EarningSearchFilter mapFilter(EarningFilterRestDto entity);

}
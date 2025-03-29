package at.dhinterndorfer.faktura.prepaidtax;

import at.dhinterndorfer.faktura.dto.v1.PrepaidTaxPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.PrepaidTaxRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper
public interface PrepaidTaxMapper {

    PrepaidTaxRestDto mapToDto(PrepaidTax entity);

    List<PrepaidTaxRestDto> mapToDto(List<PrepaidTax> entityList);

    PrepaidTax mapToDbo(PrepaidTaxRestDto entity);

    List<PrepaidTax> mapToDbo(List<PrepaidTaxRestDto> entityList);

    default PrepaidTaxPageRestDto mapPage(Page<PrepaidTax> page) {
        PrepaidTaxPageRestDto pageRestDto = new PrepaidTaxPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }
}
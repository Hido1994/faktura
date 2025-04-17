package at.dhinterndorfer.faktura.sale.service;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.dto.v1.SaleServiceFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServiceRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class})
public interface SaleServiceMapper {

    SaleServiceRestDto mapToDto(SaleService entity);

    List<SaleServiceRestDto> mapToDto(List<SaleService> entityList);

    SaleService mapToDbo(SaleServiceRestDto entity);

    List<SaleService> mapToDbo(List<SaleServiceRestDto> entityList);

    default SaleServicePageRestDto mapPage(Page<SaleService> page) {
        SaleServicePageRestDto pageRestDto = new SaleServicePageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    SaleServiceSearchFilter mapFilter(SaleServiceFilterRestDto entity);

}
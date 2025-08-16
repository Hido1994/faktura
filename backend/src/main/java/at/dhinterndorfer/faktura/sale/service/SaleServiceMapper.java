package at.dhinterndorfer.faktura.sale.service;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.commons.filter.OperatorTupleMapper;
import at.dhinterndorfer.faktura.dto.v1.SaleServiceFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SaleServiceRestDto;
import at.dhinterndorfer.faktura.invoice.InvoiceMapper;
import at.dhinterndorfer.faktura.timeentry.TimeEntryMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class, OperatorTupleMapper.class, TimeEntryMapper.class})
public interface SaleServiceMapper {

    @Mapping(target = "invoice.saleArticles", ignore = true)
    @Mapping(target = "invoice.saleServices", ignore = true)
    SaleServiceRestDto mapToDto(SaleService entity);

    List<SaleServiceRestDto> mapToDto(List<SaleService> entityList);

    @Mapping(target = "invoice.saleArticles", ignore = true)
    @Mapping(target = "invoice.saleServices", ignore = true)
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
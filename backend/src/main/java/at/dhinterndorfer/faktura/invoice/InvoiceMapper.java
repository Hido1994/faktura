package at.dhinterndorfer.faktura.invoice;

import at.dhinterndorfer.faktura.commons.filter.NullableMapper;
import at.dhinterndorfer.faktura.dto.v1.InvoiceFilterRestDto;
import at.dhinterndorfer.faktura.dto.v1.InvoicePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.InvoiceRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper(uses = {NullableMapper.class})
public interface InvoiceMapper {

    InvoiceRestDto mapToDto(Invoice entity);

    List<InvoiceRestDto> mapToDto(List<Invoice> entityList);

    Invoice mapToDbo(InvoiceRestDto entity);

    List<Invoice> mapToDbo(List<InvoiceRestDto> entityList);

    default InvoicePageRestDto mapPage(Page<Invoice> page) {
        InvoicePageRestDto pageRestDto = new InvoicePageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }

    InvoiceSearchFilter mapFilter(InvoiceFilterRestDto entity);

}
package at.dhinterndorfer.faktura.supplier;

import at.dhinterndorfer.faktura.dto.v1.SupplierPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.SupplierRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper
public interface SupplierMapper {

    SupplierRestDto mapToDto(Supplier entity);

    List<SupplierRestDto> mapToDto(List<Supplier> entityList);

    Supplier mapToDbo(SupplierRestDto entity);

    List<Supplier> mapToDbo(List<SupplierRestDto> entityList);

    default SupplierPageRestDto mapPage(Page<Supplier> page) {
        SupplierPageRestDto pageRestDto = new SupplierPageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }
}
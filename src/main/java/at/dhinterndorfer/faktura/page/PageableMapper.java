package at.dhinterndorfer.faktura.page;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Pageable;

@Mapper
public interface PageableMapper {
    default Pageable map(PageableRestDto pageable) {
        if (pageable == null || pageable.getPageNumber() == null || pageable.getPageSize() == null) {
            return Pageable.unpaged();
        } else {
            return Pageable.ofSize(pageable.getPageSize()).withPage(pageable.getPageNumber());
        }

    }
}
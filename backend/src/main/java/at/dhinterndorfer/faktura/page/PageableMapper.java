package at.dhinterndorfer.faktura.page;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@Mapper
public interface PageableMapper {
    default Pageable map(PageableRestDto pageable) {
        Pageable result;
        if (pageable == null || pageable.getPageNumber() == null || pageable.getPageSize() == null) {
            result = Pageable.unpaged();
        } else {
            result = Pageable.ofSize(pageable.getPageSize()).withPage(pageable.getPageNumber());
        }

        if (pageable != null && pageable.getSort() != null) {
            result.getSort().and(pageable.getSort().stream()
                .map(sort -> new Sort.Order(Sort.Direction.valueOf(sort.getDirection().getValue()),
                    sort.getProperty()))
                .toList());
        }

        return result;

    }
}
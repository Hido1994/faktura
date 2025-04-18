package at.dhinterndorfer.faktura.commons.page;

import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@Mapper
public interface PageableMapper {
    default Pageable map(PageableRestDto pageable) {
        Pageable result;
        Sort sort = Sort.unsorted();

        if (pageable != null && pageable.getSort() != null) {
            sort = Sort.by(pageable.getSort().stream()
                .map(order -> new Sort.Order(Sort.Direction.valueOf(order.getDirection().getValue()),
                    order.getProperty(), true, Sort.NullHandling.NULLS_FIRST))
                .toList());
        }

        if (pageable == null || pageable.getPageNumber() == null || pageable.getPageSize() == null) {
            result = Pageable.unpaged(sort);
        } else {
            result = PageRequest
                .ofSize(pageable.getPageSize())
                .withPage(pageable.getPageNumber())
                .withSort(sort);
        }

        return result;

    }
}
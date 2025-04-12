package at.dhinterndorfer.faktura.customer;

import at.dhinterndorfer.faktura.dto.v1.CustomerPageRestDto;
import at.dhinterndorfer.faktura.dto.v1.CustomerRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.commons.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class CustomerController {
    private final PageableMapper pageableMapper;

    private final CustomerService service;
    private final CustomerMapper mapper;


    public CustomerRestDto save(@NonNull CustomerRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public CustomerRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public CustomerPageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
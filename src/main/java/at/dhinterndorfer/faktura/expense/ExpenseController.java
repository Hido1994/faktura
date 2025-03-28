package at.dhinterndorfer.faktura.expense;

import at.dhinterndorfer.faktura.dto.v1.ExpensePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.ExpenseRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import at.dhinterndorfer.faktura.page.PageableMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class ExpenseController {
    private final PageableMapper pageableMapper;

    private final ExpenseService service;
    private final ExpenseMapper mapper;


    public ExpenseRestDto save(@NonNull ExpenseRestDto entity) {
        return mapper.mapToDto(service.save(mapper.mapToDbo(entity)));
    }

    public ExpenseRestDto findById(@NonNull Long objId) {
        return mapper.mapToDto(service.findById(objId));
    }

    public ExpensePageRestDto findAll(PageableRestDto pageable) {
        return mapper.mapPage(service.findAll(pageableMapper.map(pageable)));
    }

    public void delete(@NonNull Long objId) {
        service.delete(objId);
    }
}
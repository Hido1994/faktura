package at.dhinterndorfer.faktura.expense;

import at.dhinterndorfer.faktura.dto.v1.ExpensePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.ExpenseRestDto;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;

import java.util.List;

@Mapper
public interface ExpenseMapper {

    ExpenseRestDto mapToDto(Expense entity);

    List<ExpenseRestDto> mapToDto(List<Expense> entityList);

    Expense mapToDbo(ExpenseRestDto entity);

    List<Expense> mapToDbo(List<ExpenseRestDto> entityList);

    default ExpensePageRestDto mapPage(Page<Expense> page) {
        ExpensePageRestDto pageRestDto = new ExpensePageRestDto();
        pageRestDto.setContent(mapToDto(page.getContent()));
        pageRestDto.setSize(page.getSize());
        pageRestDto.setNumber(page.getNumber());
        return pageRestDto;
    }
}
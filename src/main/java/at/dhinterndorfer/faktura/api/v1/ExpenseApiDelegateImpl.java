package at.dhinterndorfer.faktura.api.v1;

import at.dhinterndorfer.faktura.expense.ExpenseController;
import at.dhinterndorfer.faktura.dto.v1.ExpensePageRestDto;
import at.dhinterndorfer.faktura.dto.v1.ExpenseRestDto;
import at.dhinterndorfer.faktura.dto.v1.PageableRestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class ExpenseApiDelegateImpl implements ExpenseApiDelegate {
    private final ExpenseController expenseController;

    @Override
    public ResponseEntity<Void> deleteExpense(Long id) {
        expenseController.delete(id);
        return ResponseEntity.ok().build();
    }

    @Override
    public ResponseEntity<ExpenseRestDto> getExpenseById(Long id) {
        return ResponseEntity.ok(expenseController.findById(id));
    }

    @Override
    public ResponseEntity<ExpensePageRestDto> getExpenses(PageableRestDto pageable) {
        return ResponseEntity.ok(expenseController.findAll(pageable));
    }

    @Override
    public ResponseEntity<ExpenseRestDto> saveExpense(ExpenseRestDto expenseRestDto) {
        return ResponseEntity.ok(expenseController.save(expenseRestDto));
    }
}

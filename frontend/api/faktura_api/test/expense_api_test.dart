import 'package:test/test.dart';
import 'package:faktura_api/faktura_api.dart';

/// tests for ExpenseApi
void main() {
  final instance = FakturaApi().getExpenseApi();

  group(ExpenseApi, () {
    // Deletes a entity.
    //
    //Future deleteExpense(int id) async
    test('test deleteExpense', () async {
      // TODO
    });

    // Find by ID.
    //
    //Future<Expense> getExpenseById(int id) async
    test('test getExpenseById', () async {
      // TODO
    });

    //Future<ExpensePage> getExpenses({ Pageable pageable }) async
    test('test getExpenses', () async {
      // TODO
    });

    //Future<Expense> saveExpense(Expense expense) async
    test('test saveExpense', () async {
      // TODO
    });
  });
}

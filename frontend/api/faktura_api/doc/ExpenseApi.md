# faktura_api.api.ExpenseApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteExpense**](ExpenseApi.md#deleteexpense) | **DELETE** /expense/{id} | Deletes a entity.
[**getExpenseById**](ExpenseApi.md#getexpensebyid) | **GET** /expense/{id} | Find by ID.
[**getExpenses**](ExpenseApi.md#getexpenses) | **GET** /expense | 
[**saveExpense**](ExpenseApi.md#saveexpense) | **POST** /expense | 


# **deleteExpense**
> deleteExpense(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getExpenseApi();
final int id = 789; // int | Id to delete

try {
    api.deleteExpense(id);
} catch on DioException (e) {
    print('Exception when calling ExpenseApi->deleteExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Id to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExpenseById**
> Expense getExpenseById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getExpenseApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getExpenseById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ExpenseApi->getExpenseById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**Expense**](Expense.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExpenses**
> ExpensePage getExpenses(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getExpenseApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getExpenses(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ExpenseApi->getExpenses: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](.md)|  | [optional] 

### Return type

[**ExpensePage**](ExpensePage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveExpense**
> Expense saveExpense(expense)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getExpenseApi();
final Expense expense = ; // Expense | 

try {
    final response = api.saveExpense(expense);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ExpenseApi->saveExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expense** | [**Expense**](Expense.md)|  | 

### Return type

[**Expense**](Expense.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


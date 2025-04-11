# faktura_api.api.InvoiceApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteInvoice**](InvoiceApi.md#deleteinvoice) | **DELETE** /invoice/{id} | Deletes a entity.
[**getInvoiceById**](InvoiceApi.md#getinvoicebyid) | **GET** /invoice/{id} | Find by ID.
[**getInvoices**](InvoiceApi.md#getinvoices) | **GET** /invoice | 
[**saveInvoice**](InvoiceApi.md#saveinvoice) | **POST** /invoice | 


# **deleteInvoice**
> deleteInvoice(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInvoiceApi();
final int id = 789; // int | Id to delete

try {
    api.deleteInvoice(id);
} catch on DioException (e) {
    print('Exception when calling InvoiceApi->deleteInvoice: $e\n');
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

# **getInvoiceById**
> Invoice getInvoiceById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInvoiceApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getInvoiceById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InvoiceApi->getInvoiceById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**Invoice**](Invoice.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getInvoices**
> InvoicePage getInvoices(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInvoiceApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getInvoices(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InvoiceApi->getInvoices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**InvoicePage**](InvoicePage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveInvoice**
> Invoice saveInvoice(invoice)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInvoiceApi();
final Invoice invoice = ; // Invoice | 

try {
    final response = api.saveInvoice(invoice);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InvoiceApi->saveInvoice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice** | [**Invoice**](Invoice.md)|  | 

### Return type

[**Invoice**](Invoice.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# faktura_api.api.CustomerApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteCustomer**](CustomerApi.md#deletecustomer) | **DELETE** /customer/{id} | Deletes a entity.
[**getCustomerById**](CustomerApi.md#getcustomerbyid) | **GET** /customer/{id} | Find by ID.
[**getCustomers**](CustomerApi.md#getcustomers) | **GET** /customer | 
[**saveCustomer**](CustomerApi.md#savecustomer) | **POST** /customer | 


# **deleteCustomer**
> deleteCustomer(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getCustomerApi();
final int id = 789; // int | Id to delete

try {
    api.deleteCustomer(id);
} catch on DioException (e) {
    print('Exception when calling CustomerApi->deleteCustomer: $e\n');
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

# **getCustomerById**
> Customer getCustomerById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getCustomerApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getCustomerById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomerApi->getCustomerById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**Customer**](Customer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCustomers**
> CustomerPage getCustomers(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getCustomerApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getCustomers(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomerApi->getCustomers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](.md)|  | [optional] 

### Return type

[**CustomerPage**](CustomerPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveCustomer**
> Customer saveCustomer(customer)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getCustomerApi();
final Customer customer = ; // Customer | 

try {
    final response = api.saveCustomer(customer);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CustomerApi->saveCustomer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer** | [**Customer**](Customer.md)|  | 

### Return type

[**Customer**](Customer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# faktura_api.api.SupplierApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteSupplier**](SupplierApi.md#deletesupplier) | **DELETE** /supplier/{id} | Deletes a entity.
[**getSupplierById**](SupplierApi.md#getsupplierbyid) | **GET** /supplier/{id} | Find by ID.
[**getSuppliers**](SupplierApi.md#getsuppliers) | **GET** /supplier | 
[**saveSupplier**](SupplierApi.md#savesupplier) | **POST** /supplier | 


# **deleteSupplier**
> deleteSupplier(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSupplierApi();
final int id = 789; // int | Id to delete

try {
    api.deleteSupplier(id);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->deleteSupplier: $e\n');
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

# **getSupplierById**
> Supplier getSupplierById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSupplierApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getSupplierById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->getSupplierById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**Supplier**](Supplier.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSuppliers**
> SupplierPage getSuppliers(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSupplierApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getSuppliers(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->getSuppliers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**SupplierPage**](SupplierPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveSupplier**
> Supplier saveSupplier(supplier)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSupplierApi();
final Supplier supplier = ; // Supplier | 

try {
    final response = api.saveSupplier(supplier);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SupplierApi->saveSupplier: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **supplier** | [**Supplier**](Supplier.md)|  | 

### Return type

[**Supplier**](Supplier.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


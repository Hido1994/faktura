# faktura_api.api.SaleServiceApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteSaleService**](SaleServiceApi.md#deletesaleservice) | **DELETE** /saleService/{id} | Deletes a entity.
[**getSaleServiceById**](SaleServiceApi.md#getsaleservicebyid) | **GET** /saleService/{id} | Find by ID.
[**getSaleServices**](SaleServiceApi.md#getsaleservices) | **GET** /saleService | 
[**saveSaleService**](SaleServiceApi.md#savesaleservice) | **POST** /saleService | 


# **deleteSaleService**
> deleteSaleService(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleServiceApi();
final int id = 789; // int | Id to delete

try {
    api.deleteSaleService(id);
} catch on DioException (e) {
    print('Exception when calling SaleServiceApi->deleteSaleService: $e\n');
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

# **getSaleServiceById**
> SaleService getSaleServiceById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleServiceApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getSaleServiceById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SaleServiceApi->getSaleServiceById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**SaleService**](SaleService.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSaleServices**
> SaleServicePage getSaleServices(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleServiceApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getSaleServices(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SaleServiceApi->getSaleServices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**SaleServicePage**](SaleServicePage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveSaleService**
> SaleService saveSaleService(saleService)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleServiceApi();
final SaleService saleService = ; // SaleService | 

try {
    final response = api.saveSaleService(saleService);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SaleServiceApi->saveSaleService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **saleService** | [**SaleService**](SaleService.md)|  | 

### Return type

[**SaleService**](SaleService.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


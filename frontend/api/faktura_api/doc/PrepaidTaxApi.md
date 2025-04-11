# faktura_api.api.PrepaidTaxApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deletePrepaidTax**](PrepaidTaxApi.md#deleteprepaidtax) | **DELETE** /prepaidTax/{id} | Deletes a entity.
[**getPrepaidTaxById**](PrepaidTaxApi.md#getprepaidtaxbyid) | **GET** /prepaidTax/{id} | Find by ID.
[**getPrepaidTaxes**](PrepaidTaxApi.md#getprepaidtaxes) | **GET** /prepaidTax | 
[**savePrepaidTax**](PrepaidTaxApi.md#saveprepaidtax) | **POST** /prepaidTax | 


# **deletePrepaidTax**
> deletePrepaidTax(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPrepaidTaxApi();
final int id = 789; // int | Id to delete

try {
    api.deletePrepaidTax(id);
} catch on DioException (e) {
    print('Exception when calling PrepaidTaxApi->deletePrepaidTax: $e\n');
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

# **getPrepaidTaxById**
> PrepaidTax getPrepaidTaxById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPrepaidTaxApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getPrepaidTaxById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PrepaidTaxApi->getPrepaidTaxById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**PrepaidTax**](PrepaidTax.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPrepaidTaxes**
> PrepaidTaxPage getPrepaidTaxes(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPrepaidTaxApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getPrepaidTaxes(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PrepaidTaxApi->getPrepaidTaxes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**PrepaidTaxPage**](PrepaidTaxPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **savePrepaidTax**
> PrepaidTax savePrepaidTax(prepaidTax)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPrepaidTaxApi();
final PrepaidTax prepaidTax = ; // PrepaidTax | 

try {
    final response = api.savePrepaidTax(prepaidTax);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PrepaidTaxApi->savePrepaidTax: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prepaidTax** | [**PrepaidTax**](PrepaidTax.md)|  | 

### Return type

[**PrepaidTax**](PrepaidTax.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


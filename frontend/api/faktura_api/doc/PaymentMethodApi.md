# faktura_api.api.PaymentMethodApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deletePaymentMethod**](PaymentMethodApi.md#deletepaymentmethod) | **DELETE** /paymentMethod/{id} | Deletes a entity.
[**getPaymentMethodById**](PaymentMethodApi.md#getpaymentmethodbyid) | **GET** /paymentMethod/{id} | Find by ID.
[**getPaymentMethods**](PaymentMethodApi.md#getpaymentmethods) | **GET** /paymentMethod | 
[**savePaymentMethod**](PaymentMethodApi.md#savepaymentmethod) | **POST** /paymentMethod | 


# **deletePaymentMethod**
> deletePaymentMethod(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPaymentMethodApi();
final int id = 789; // int | Id to delete

try {
    api.deletePaymentMethod(id);
} catch on DioException (e) {
    print('Exception when calling PaymentMethodApi->deletePaymentMethod: $e\n');
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

# **getPaymentMethodById**
> PaymentMethod getPaymentMethodById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPaymentMethodApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getPaymentMethodById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PaymentMethodApi->getPaymentMethodById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**PaymentMethod**](PaymentMethod.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPaymentMethods**
> PaymentMethodPage getPaymentMethods(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPaymentMethodApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getPaymentMethods(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PaymentMethodApi->getPaymentMethods: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](.md)|  | [optional] 

### Return type

[**PaymentMethodPage**](PaymentMethodPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **savePaymentMethod**
> PaymentMethod savePaymentMethod(paymentMethod)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getPaymentMethodApi();
final PaymentMethod paymentMethod = ; // PaymentMethod | 

try {
    final response = api.savePaymentMethod(paymentMethod);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PaymentMethodApi->savePaymentMethod: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **paymentMethod** | [**PaymentMethod**](PaymentMethod.md)|  | 

### Return type

[**PaymentMethod**](PaymentMethod.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


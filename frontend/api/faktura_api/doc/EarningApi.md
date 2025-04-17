# faktura_api.api.EarningApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteEarning**](EarningApi.md#deleteearning) | **DELETE** /earning/{id} | Deletes a entity.
[**getEarningById**](EarningApi.md#getearningbyid) | **GET** /earning/{id} | Find by ID.
[**getEarnings**](EarningApi.md#getearnings) | **GET** /earning | 
[**saveEarning**](EarningApi.md#saveearning) | **POST** /earning | 


# **deleteEarning**
> deleteEarning(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getEarningApi();
final int id = 789; // int | Id to delete

try {
    api.deleteEarning(id);
} catch on DioException (e) {
    print('Exception when calling EarningApi->deleteEarning: $e\n');
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

# **getEarningById**
> Earning getEarningById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getEarningApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getEarningById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EarningApi->getEarningById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**Earning**](Earning.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEarnings**
> EarningPage getEarnings(earningFilterRequest)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getEarningApi();
final EarningFilterRequest earningFilterRequest = ; // EarningFilterRequest | 

try {
    final response = api.getEarnings(earningFilterRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EarningApi->getEarnings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **earningFilterRequest** | [**EarningFilterRequest**](EarningFilterRequest.md)|  | [optional] 

### Return type

[**EarningPage**](EarningPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveEarning**
> Earning saveEarning(earning)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getEarningApi();
final Earning earning = ; // Earning | 

try {
    final response = api.saveEarning(earning);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EarningApi->saveEarning: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **earning** | [**Earning**](Earning.md)|  | 

### Return type

[**Earning**](Earning.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


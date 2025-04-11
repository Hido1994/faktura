# faktura_api.api.InternationalInfoApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteInternationalInfo**](InternationalInfoApi.md#deleteinternationalinfo) | **DELETE** /internationalInfo/{id} | Deletes a entity.
[**getInternationalInfoById**](InternationalInfoApi.md#getinternationalinfobyid) | **GET** /internationalInfo/{id} | Find by ID.
[**getInternationalInfos**](InternationalInfoApi.md#getinternationalinfos) | **GET** /internationalInfo | 
[**saveInternationalInfo**](InternationalInfoApi.md#saveinternationalinfo) | **POST** /internationalInfo | 


# **deleteInternationalInfo**
> deleteInternationalInfo(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInternationalInfoApi();
final int id = 789; // int | Id to delete

try {
    api.deleteInternationalInfo(id);
} catch on DioException (e) {
    print('Exception when calling InternationalInfoApi->deleteInternationalInfo: $e\n');
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

# **getInternationalInfoById**
> InternationalInfo getInternationalInfoById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInternationalInfoApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getInternationalInfoById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InternationalInfoApi->getInternationalInfoById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**InternationalInfo**](InternationalInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getInternationalInfos**
> InternationalInfoPage getInternationalInfos(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInternationalInfoApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getInternationalInfos(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InternationalInfoApi->getInternationalInfos: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**InternationalInfoPage**](InternationalInfoPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveInternationalInfo**
> InternationalInfo saveInternationalInfo(internationalInfo)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getInternationalInfoApi();
final InternationalInfo internationalInfo = ; // InternationalInfo | 

try {
    final response = api.saveInternationalInfo(internationalInfo);
    print(response);
} catch on DioException (e) {
    print('Exception when calling InternationalInfoApi->saveInternationalInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **internationalInfo** | [**InternationalInfo**](InternationalInfo.md)|  | 

### Return type

[**InternationalInfo**](InternationalInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


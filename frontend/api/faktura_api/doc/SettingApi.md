# faktura_api.api.SettingApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteSetting**](SettingApi.md#deletesetting) | **DELETE** /setting/{id} | Deletes a entity.
[**getSettingById**](SettingApi.md#getsettingbyid) | **GET** /setting/{id} | Find by ID.
[**getSettings**](SettingApi.md#getsettings) | **GET** /setting | 
[**saveSetting**](SettingApi.md#savesetting) | **POST** /setting | 


# **deleteSetting**
> deleteSetting(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSettingApi();
final int id = 789; // int | Id to delete

try {
    api.deleteSetting(id);
} catch on DioException (e) {
    print('Exception when calling SettingApi->deleteSetting: $e\n');
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

# **getSettingById**
> Setting getSettingById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSettingApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getSettingById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingApi->getSettingById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**Setting**](Setting.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSettings**
> SettingPage getSettings(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSettingApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getSettings(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingApi->getSettings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**SettingPage**](SettingPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveSetting**
> Setting saveSetting(setting)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSettingApi();
final Setting setting = ; // Setting | 

try {
    final response = api.saveSetting(setting);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SettingApi->saveSetting: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setting** | [**Setting**](Setting.md)|  | 

### Return type

[**Setting**](Setting.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


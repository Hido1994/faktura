# faktura_api.api.FileApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteFile**](FileApi.md#deletefile) | **DELETE** /file/{id} | Deletes a entity.
[**getFileById**](FileApi.md#getfilebyid) | **GET** /file/{id} | Find by ID.
[**getFiles**](FileApi.md#getfiles) | **GET** /file | 
[**saveFile**](FileApi.md#savefile) | **POST** /file | 


# **deleteFile**
> deleteFile(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getFileApi();
final int id = 789; // int | Id to delete

try {
    api.deleteFile(id);
} catch on DioException (e) {
    print('Exception when calling FileApi->deleteFile: $e\n');
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

# **getFileById**
> File getFileById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getFileApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getFileById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FileApi->getFileById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**File**](File.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFiles**
> FilePage getFiles(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getFileApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getFiles(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FileApi->getFiles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**FilePage**](FilePage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveFile**
> File saveFile(file)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getFileApi();
final File file = ; // File | 

try {
    final response = api.saveFile(file);
    print(response);
} catch on DioException (e) {
    print('Exception when calling FileApi->saveFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | [**File**](File.md)|  | 

### Return type

[**File**](File.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


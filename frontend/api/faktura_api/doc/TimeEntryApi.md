# faktura_api.api.TimeEntryApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteTimeEntry**](TimeEntryApi.md#deletetimeentry) | **DELETE** /timeEntry/{id} | Deletes a entity.
[**getTimeEntries**](TimeEntryApi.md#gettimeentries) | **GET** /timeEntry | 
[**getTimeEntryById**](TimeEntryApi.md#gettimeentrybyid) | **GET** /timeEntry/{id} | Find by ID.
[**saveTimeEntry**](TimeEntryApi.md#savetimeentry) | **POST** /timeEntry | 


# **deleteTimeEntry**
> deleteTimeEntry(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getTimeEntryApi();
final int id = 789; // int | Id to delete

try {
    api.deleteTimeEntry(id);
} catch on DioException (e) {
    print('Exception when calling TimeEntryApi->deleteTimeEntry: $e\n');
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

# **getTimeEntries**
> TimeEntryPage getTimeEntries(timeEntryFilterRequest)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getTimeEntryApi();
final TimeEntryFilterRequest timeEntryFilterRequest = ; // TimeEntryFilterRequest | 

try {
    final response = api.getTimeEntries(timeEntryFilterRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TimeEntryApi->getTimeEntries: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **timeEntryFilterRequest** | [**TimeEntryFilterRequest**](TimeEntryFilterRequest.md)|  | [optional] 

### Return type

[**TimeEntryPage**](TimeEntryPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTimeEntryById**
> TimeEntry getTimeEntryById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getTimeEntryApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getTimeEntryById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TimeEntryApi->getTimeEntryById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**TimeEntry**](TimeEntry.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveTimeEntry**
> TimeEntry saveTimeEntry(timeEntry)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getTimeEntryApi();
final TimeEntry timeEntry = ; // TimeEntry | 

try {
    final response = api.saveTimeEntry(timeEntry);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TimeEntryApi->saveTimeEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **timeEntry** | [**TimeEntry**](TimeEntry.md)|  | 

### Return type

[**TimeEntry**](TimeEntry.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


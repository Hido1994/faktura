# faktura_api.api.AccountApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteAccount**](AccountApi.md#deleteaccount) | **DELETE** /account/{id} | Deletes a entity.
[**getAccountById**](AccountApi.md#getaccountbyid) | **GET** /account/{id} | Find by ID.
[**getAccounts**](AccountApi.md#getaccounts) | **GET** /account | 
[**saveAccount**](AccountApi.md#saveaccount) | **POST** /account | 


# **deleteAccount**
> deleteAccount(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getAccountApi();
final int id = 789; // int | Id to delete

try {
    api.deleteAccount(id);
} catch on DioException (e) {
    print('Exception when calling AccountApi->deleteAccount: $e\n');
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

# **getAccountById**
> Account getAccountById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getAccountApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getAccountById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountApi->getAccountById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**Account**](Account.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccounts**
> AccountPage getAccounts(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getAccountApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getAccounts(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountApi->getAccounts: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**AccountPage**](AccountPage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveAccount**
> Account saveAccount(account)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getAccountApi();
final Account account = ; // Account | 

try {
    final response = api.saveAccount(account);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AccountApi->saveAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account** | [**Account**](Account.md)|  | 

### Return type

[**Account**](Account.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


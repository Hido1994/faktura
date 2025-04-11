# faktura_api.api.SaleArticleApi

## Load the API package
```dart
import 'package:faktura_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteSaleArticle**](SaleArticleApi.md#deletesalearticle) | **DELETE** /saleArticle/{id} | Deletes a entity.
[**getSaleArticleById**](SaleArticleApi.md#getsalearticlebyid) | **GET** /saleArticle/{id} | Find by ID.
[**getSaleArticles**](SaleArticleApi.md#getsalearticles) | **GET** /saleArticle | 
[**saveSaleArticle**](SaleArticleApi.md#savesalearticle) | **POST** /saleArticle | 


# **deleteSaleArticle**
> deleteSaleArticle(id)

Deletes a entity.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleArticleApi();
final int id = 789; // int | Id to delete

try {
    api.deleteSaleArticle(id);
} catch on DioException (e) {
    print('Exception when calling SaleArticleApi->deleteSaleArticle: $e\n');
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

# **getSaleArticleById**
> SaleArticle getSaleArticleById(id)

Find by ID.

### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleArticleApi();
final int id = 789; // int | ID of entity

try {
    final response = api.getSaleArticleById(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SaleArticleApi->getSaleArticleById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| ID of entity | 

### Return type

[**SaleArticle**](SaleArticle.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSaleArticles**
> SaleArticlePage getSaleArticles(pageable)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleArticleApi();
final Pageable pageable = ; // Pageable | 

try {
    final response = api.getSaleArticles(pageable);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SaleArticleApi->getSaleArticles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageable** | [**Pageable**](Pageable.md)|  | [optional] 

### Return type

[**SaleArticlePage**](SaleArticlePage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveSaleArticle**
> SaleArticle saveSaleArticle(saleArticle)



### Example
```dart
import 'package:faktura_api/api.dart';

final api = FakturaApi().getSaleArticleApi();
final SaleArticle saleArticle = ; // SaleArticle | 

try {
    final response = api.saveSaleArticle(saleArticle);
    print(response);
} catch on DioException (e) {
    print('Exception when calling SaleArticleApi->saveSaleArticle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **saleArticle** | [**SaleArticle**](SaleArticle.md)|  | 

### Return type

[**SaleArticle**](SaleArticle.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


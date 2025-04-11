# faktura_api.model.SaleArticle

## Load the model package
```dart
import 'package:faktura_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **String** | Description of the sales article | 
**incomingOn** | [**Date**](Date.md) | Date when the sales article was received | 
**priceNet** | **double** | Net price of the sales article | 
**priceTax** | **double** | Tax amount of the sales article | 
**id** | **int** | Primary key identifier for the sales article | [optional] 
**supplier** | [**Supplier**](Supplier.md) |  | [optional] 
**internationalInfo** | [**InternationalInfo**](InternationalInfo.md) |  | [optional] 
**account** | [**Account**](Account.md) |  | [optional] 
**customer** | [**Customer**](Customer.md) |  | [optional] 
**paidOn** | [**Date**](Date.md) | Date when the sales article was paid | [optional] 
**invoice** | [**Invoice**](Invoice.md) |  | [optional] 
**salesNet** | **double** | Net sales amount | [optional] 
**salesTax** | **double** | Sales tax amount | [optional] 
**paymentMethod** | [**PaymentMethod**](PaymentMethod.md) |  | [optional] 
**info** | **String** | Additional information about the sales article | [optional] 
**amount** | **int** | Quantity of the sales article | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



# faktura_api.model.Expense

## Load the model package
```dart
import 'package:faktura_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Primary key identifier for the expense | 
**incomingOn** | [**Date**](Date.md) | Date when the expense was received | 
**description** | **String** | Description of the expense | 
**priceNet** | **double** | Net price of the expense | 
**priceTax** | **double** | Tax amount of the expense | 
**account** | [**Account**](Account.md) |  | [optional] 
**paidOn** | [**Date**](Date.md) | Date when the expense was paid | [optional] 
**paymentMethod** | [**PaymentMethod**](PaymentMethod.md) |  | [optional] 
**supplier** | [**Supplier**](Supplier.md) |  | [optional] 
**internationalInfo** | [**InternationalInfo**](InternationalInfo.md) |  | [optional] 
**note** | **String** | Additional notes about the expense | [optional] 
**depreciationYears** | **int** | Number of years for tax depreciation | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



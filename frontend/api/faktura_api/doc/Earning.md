# faktura_api.model.Earning

## Load the model package
```dart
import 'package:faktura_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **String** | Description of the earning | 
**id** | **int** | Primary key identifier for the earning | [optional] 
**account** | [**Account**](Account.md) |  | [optional] 
**priceNet** | **double** | Net price of the earning | [optional] 
**paidOn** | [**Date**](Date.md) | Date when the earning was paid | [optional] 
**paymentMethod** | [**PaymentMethod**](PaymentMethod.md) |  | [optional] 
**supplier** | [**Supplier**](Supplier.md) |  | [optional] 
**note** | **String** | Additional notes about the earning | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



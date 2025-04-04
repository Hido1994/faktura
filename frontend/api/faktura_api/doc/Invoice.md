# faktura_api.model.Invoice

## Load the model package
```dart
import 'package:faktura_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Primary key identifier for the invoice | 
**subject** | **String** | Subject of the invoice | 
**createdOn** | [**Date**](Date.md) | Date when the invoice was created | 
**invoiceNumber** | **int** | Invoice number | [optional] 
**paidOn** | [**Date**](Date.md) | Date when the invoice was paid | [optional] 
**paymentMethod** | [**PaymentMethod**](PaymentMethod.md) |  | [optional] 
**customer** | [**Customer**](Customer.md) |  | [optional] 
**servicePeriod** | **String** | Period of service covered by the invoice | [optional] 
**revision** | **String** | Revision information for the invoice | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



# faktura_api.model.SaleService

## Load the model package
```dart
import 'package:faktura_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Primary key identifier for the sales service | 
**hourlyRate** | **double** | Hourly rate for the service | 
**suppliedOn** | [**Date**](Date.md) | Date when the service was supplied | 
**hours** | **double** | Number of hours of service provided | 
**description** | **String** | Description of the sales service | 
**customer** | [**Customer**](Customer.md) |  | [optional] 
**invoice** | [**Invoice**](Invoice.md) |  | [optional] 
**timeInfo** | **String** | Time information for the service | [optional] 
**salesNet** | **double** | Net sales amount | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)



import 'package:dio/dio.dart';
import 'package:faktura_api/faktura_api.dart';

class CustomerService {
  final CustomerApi _customerApi;

  const CustomerService(this._customerApi);

  Future<Response<CustomerPage>> getAll() async {
    return _customerApi.getCustomers();
  }
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:faktura_api/src/serializers.dart';
import 'package:faktura_api/src/auth/api_key_auth.dart';
import 'package:faktura_api/src/auth/basic_auth.dart';
import 'package:faktura_api/src/auth/bearer_auth.dart';
import 'package:faktura_api/src/auth/oauth.dart';
import 'package:faktura_api/src/api/account_api.dart';
import 'package:faktura_api/src/api/customer_api.dart';
import 'package:faktura_api/src/api/earning_api.dart';
import 'package:faktura_api/src/api/expense_api.dart';
import 'package:faktura_api/src/api/file_api.dart';
import 'package:faktura_api/src/api/international_info_api.dart';
import 'package:faktura_api/src/api/invoice_api.dart';
import 'package:faktura_api/src/api/payment_method_api.dart';
import 'package:faktura_api/src/api/prepaid_tax_api.dart';
import 'package:faktura_api/src/api/sale_article_api.dart';
import 'package:faktura_api/src/api/sale_service_api.dart';
import 'package:faktura_api/src/api/setting_api.dart';
import 'package:faktura_api/src/api/supplier_api.dart';
import 'package:faktura_api/src/api/time_entry_api.dart';

class FakturaApi {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  FakturaApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get AccountApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AccountApi getAccountApi() {
    return AccountApi(dio, serializers);
  }

  /// Get CustomerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CustomerApi getCustomerApi() {
    return CustomerApi(dio, serializers);
  }

  /// Get EarningApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EarningApi getEarningApi() {
    return EarningApi(dio, serializers);
  }

  /// Get ExpenseApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExpenseApi getExpenseApi() {
    return ExpenseApi(dio, serializers);
  }

  /// Get FileApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FileApi getFileApi() {
    return FileApi(dio, serializers);
  }

  /// Get InternationalInfoApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InternationalInfoApi getInternationalInfoApi() {
    return InternationalInfoApi(dio, serializers);
  }

  /// Get InvoiceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InvoiceApi getInvoiceApi() {
    return InvoiceApi(dio, serializers);
  }

  /// Get PaymentMethodApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PaymentMethodApi getPaymentMethodApi() {
    return PaymentMethodApi(dio, serializers);
  }

  /// Get PrepaidTaxApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PrepaidTaxApi getPrepaidTaxApi() {
    return PrepaidTaxApi(dio, serializers);
  }

  /// Get SaleArticleApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SaleArticleApi getSaleArticleApi() {
    return SaleArticleApi(dio, serializers);
  }

  /// Get SaleServiceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SaleServiceApi getSaleServiceApi() {
    return SaleServiceApi(dio, serializers);
  }

  /// Get SettingApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SettingApi getSettingApi() {
    return SettingApi(dio, serializers);
  }

  /// Get SupplierApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SupplierApi getSupplierApi() {
    return SupplierApi(dio, serializers);
  }

  /// Get TimeEntryApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TimeEntryApi getTimeEntryApi() {
    return TimeEntryApi(dio, serializers);
  }
}

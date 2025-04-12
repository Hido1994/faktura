//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:faktura_api/src/date_serializer.dart';
import 'package:faktura_api/src/model/date.dart';

import 'package:faktura_api/src/model/account.dart';
import 'package:faktura_api/src/model/account_list.dart';
import 'package:faktura_api/src/model/account_page.dart';
import 'package:faktura_api/src/model/customer.dart';
import 'package:faktura_api/src/model/customer_list.dart';
import 'package:faktura_api/src/model/customer_page.dart';
import 'package:faktura_api/src/model/earning.dart';
import 'package:faktura_api/src/model/earning_list.dart';
import 'package:faktura_api/src/model/earning_page.dart';
import 'package:faktura_api/src/model/expense.dart';
import 'package:faktura_api/src/model/expense_list.dart';
import 'package:faktura_api/src/model/expense_page.dart';
import 'package:faktura_api/src/model/file.dart';
import 'package:faktura_api/src/model/file_list.dart';
import 'package:faktura_api/src/model/file_page.dart';
import 'package:faktura_api/src/model/international_info.dart';
import 'package:faktura_api/src/model/international_info_list.dart';
import 'package:faktura_api/src/model/international_info_page.dart';
import 'package:faktura_api/src/model/invoice.dart';
import 'package:faktura_api/src/model/invoice_list.dart';
import 'package:faktura_api/src/model/invoice_page.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:faktura_api/src/model/payment_method.dart';
import 'package:faktura_api/src/model/payment_method_list.dart';
import 'package:faktura_api/src/model/payment_method_page.dart';
import 'package:faktura_api/src/model/prepaid_tax.dart';
import 'package:faktura_api/src/model/prepaid_tax_list.dart';
import 'package:faktura_api/src/model/prepaid_tax_page.dart';
import 'package:faktura_api/src/model/sale_article.dart';
import 'package:faktura_api/src/model/sale_article_list.dart';
import 'package:faktura_api/src/model/sale_article_page.dart';
import 'package:faktura_api/src/model/sale_service.dart';
import 'package:faktura_api/src/model/sale_service_list.dart';
import 'package:faktura_api/src/model/sale_service_page.dart';
import 'package:faktura_api/src/model/setting.dart';
import 'package:faktura_api/src/model/setting_list.dart';
import 'package:faktura_api/src/model/setting_page.dart';
import 'package:faktura_api/src/model/sort.dart';
import 'package:faktura_api/src/model/supplier.dart';
import 'package:faktura_api/src/model/supplier_filter.dart';
import 'package:faktura_api/src/model/supplier_filter_request.dart';
import 'package:faktura_api/src/model/supplier_list.dart';
import 'package:faktura_api/src/model/supplier_page.dart';
import 'package:faktura_api/src/model/time_entry.dart';
import 'package:faktura_api/src/model/time_entry_list.dart';
import 'package:faktura_api/src/model/time_entry_page.dart';

part 'serializers.g.dart';

@SerializersFor([
  Account,
  AccountList,
  $AccountList,
  AccountPage,
  Customer,
  CustomerList,
  $CustomerList,
  CustomerPage,
  Earning,
  EarningList,
  $EarningList,
  EarningPage,
  Expense,
  ExpenseList,
  $ExpenseList,
  ExpensePage,
  File,
  FileList,
  $FileList,
  FilePage,
  InternationalInfo,
  InternationalInfoList,
  $InternationalInfoList,
  InternationalInfoPage,
  Invoice,
  InvoiceList,
  $InvoiceList,
  InvoicePage,
  Page,
  $Page,
  Pageable,
  PaymentMethod,
  PaymentMethodList,
  $PaymentMethodList,
  PaymentMethodPage,
  PrepaidTax,
  PrepaidTaxList,
  $PrepaidTaxList,
  PrepaidTaxPage,
  SaleArticle,
  SaleArticleList,
  $SaleArticleList,
  SaleArticlePage,
  SaleService,
  SaleServiceList,
  $SaleServiceList,
  SaleServicePage,
  Setting,
  SettingList,
  $SettingList,
  SettingPage,
  Sort,
  Supplier,
  SupplierFilter,
  SupplierFilterRequest,
  SupplierList,
  $SupplierList,
  SupplierPage,
  TimeEntry,
  TimeEntryList,
  $TimeEntryList,
  TimeEntryPage,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(AccountList.serializer)
      ..add(CustomerList.serializer)
      ..add(EarningList.serializer)
      ..add(ExpenseList.serializer)
      ..add(FileList.serializer)
      ..add(InternationalInfoList.serializer)
      ..add(InvoiceList.serializer)
      ..add(Page.serializer)
      ..add(PaymentMethodList.serializer)
      ..add(PrepaidTaxList.serializer)
      ..add(SaleArticleList.serializer)
      ..add(SaleServiceList.serializer)
      ..add(SettingList.serializer)
      ..add(SupplierList.serializer)
      ..add(TimeEntryList.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

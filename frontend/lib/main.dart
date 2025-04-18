import 'package:dio/dio.dart';
import 'package:faktura/app_state_model.dart';
import 'package:faktura/paymentmethod/payment_method_model.dart';
import 'package:faktura/prepaidtax/prepaid_tax_model.dart';
import 'package:faktura/sale/article/sale_article_model.dart';
import 'package:faktura/sale/service/sale_service_model.dart';
import 'package:faktura/state/trip_provider_state.dart';
import 'package:faktura/supplier/supplier_model.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'account/account_model.dart';
import 'common/app_routes.dart';
import 'customer/customer_model.dart';
import 'expense/expense_model.dart';
import 'internationalinfo/international_info_model.dart';
import 'invoice/invoice_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateModel>(
            create: (context) => AppStateModel()),
        Provider<Dio>(
          create: (_) => Dio(BaseOptions(
              baseUrl: "http://10.0.2.2:8080/api/v1",
              connectTimeout: Duration(seconds: 10))),
        ),
        Provider<AccountApi>(
          create: (context) => AccountApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<AccountModel>(
            create: (context) => AccountModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<AccountApi>(context, listen: false))),
        Provider<CustomerApi>(
          create: (context) => CustomerApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<CustomerModel>(
            create: (context) => CustomerModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<CustomerApi>(context, listen: false))),
        Provider<SupplierApi>(
          create: (context) => SupplierApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<SupplierModel>(
            create: (context) => SupplierModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<SupplierApi>(context, listen: false))),
        Provider<PaymentMethodApi>(
          create: (context) => PaymentMethodApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<PaymentMethodModel>(
            create: (context) => PaymentMethodModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<PaymentMethodApi>(context, listen: false))),
        Provider<ExpenseApi>(
          create: (context) => ExpenseApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<ExpenseModel>(
            create: (context) => ExpenseModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<ExpenseApi>(context, listen: false))),
        Provider<SaleServiceApi>(
          create: (context) => SaleServiceApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<SaleServiceModel>(
            create: (context) => SaleServiceModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<SaleServiceApi>(context, listen: false))),
        Provider<SaleArticleApi>(
          create: (context) => SaleArticleApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<SaleArticleModel>(
            create: (context) => SaleArticleModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<SaleArticleApi>(context, listen: false))),
        Provider<TimeEntryApi>(
          create: (context) => TimeEntryApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<TimeEntryModel>(
            create: (context) => TimeEntryModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<TimeEntryApi>(context, listen: false))),
        Provider<InvoiceApi>(
          create: (context) => InvoiceApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<InvoiceModel>(
            create: (context) => InvoiceModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<InvoiceApi>(context, listen: false))),
        Provider<PrepaidTaxApi>(
          create: (context) => PrepaidTaxApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<PrepaidTaxModel>(
            create: (context) => PrepaidTaxModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<PrepaidTaxApi>(context, listen: false))),
        Provider<InternationalInfoApi>(
          create: (context) => InternationalInfoApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<InternationalInfoModel>(
            create: (context) => InternationalInfoModel(
                Provider.of<AppStateModel>(context, listen: false),
                Provider.of<InternationalInfoApi>(context, listen: false))),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faktura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.light,
      home: Stack(children: [
        MainScreen(),
        Consumer<AppStateModel>(
          builder: (context, model, child) {
            if (model.message != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(model.message!),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                model.message = null;
              });
            }
            return model.loading
                ? Container(
                    color: Colors.black.withValues(alpha: 0.5),
                    child: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ]),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AccountModel>(context, listen: false).getAll();
      Provider.of<PaymentMethodModel>(context, listen: false).getAll();
      Provider.of<SupplierModel>(context, listen: false).getAll();
      Provider.of<InternationalInfoModel>(context, listen: false).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (context) => TripProviderState(),
          child: Navigator(
            key: _navigatorKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                  builder: (_) => appRoutes.firstWhere(
                        (item) => item['route'] == settings.name,
                      )['component']);
            },
          )),
    );
  }
}

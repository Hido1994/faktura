import 'package:dio/dio.dart';
import 'package:faktura/state/trip_provider_state.dart';
import 'package:faktura/supplier/supplier_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/app_routes.dart';
import 'customer/customer_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Dio>(
          create: (_) =>
              Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080/api/v1", connectTimeout: Duration(seconds: 20))),
        ),
        Provider<CustomerApi>(
          create: (context) => CustomerApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<CustomerModel>(
            create: (context) => CustomerModel(
                Provider.of<CustomerApi>(context, listen: false))),
        Provider<SupplierApi>(
          create: (context) => SupplierApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        ChangeNotifierProvider<SupplierModel>(
            create: (context) =>
                SupplierModel(Provider.of<SupplierApi>(context, listen: false)))
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
      home: const MainScreen(),
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

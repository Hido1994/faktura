import 'package:dio/dio.dart';
import 'package:faktura/service/customer_service.dart';
import 'package:faktura/state/trip_provider_state.dart';
import 'package:faktura/view/customers/customers_screen.dart';
import 'package:faktura/view/screen/calendar_screen.dart';
import 'package:faktura/view/screen/report_screen.dart';
import 'package:faktura/view/screen/settings_screen.dart';
import 'package:faktura/view/screen/trips_screen.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Dio>(
          create: (_) =>
              Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080/api/v1")),
        ),
        Provider<CustomerApi>(
          create: (context) => CustomerApi(
              Provider.of<Dio>(context, listen: false), standardSerializers),
        ),
        Provider<CustomerService>(
          create: (context) =>
              CustomerService(Provider.of<CustomerApi>(context, listen: false)),
        ),
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
  String _currentRoute = "/";
  final _navigatorKey = GlobalKey<NavigatorState>();

  Map<String, Map<String, dynamic>> routes = {
    '/': {'title': 'Trips', 'component': const TripsScreen()},
    '/report': {'title': 'Reports', 'component': const ReportScreen()},
    '/settings': {'title': 'Settings', 'component': const SettingsScreen()},
    '/calendar': {'title': 'Tracking', 'component': const CalendarScreen()},
    '/customers': {'title': 'Customers', 'component': const CustomersScreen()},
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faktura"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Kunden'),
              onTap: () {
                _navigatorKey.currentState?.pushNamed("/customers");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: ChangeNotifierProvider(
          create: (context) => TripProviderState(),
          child: Navigator(
            initialRoute: _currentRoute,
            key: _navigatorKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                  builder: (_) => routes[settings.name]!['component']);
            },
          )),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:faktura/service/customer_service.dart';
import 'package:faktura/state/trip_provider_state.dart';
import 'package:faktura/view/screen/calendar_screen.dart';
import 'package:faktura/view/screen/customers_screen.dart';
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
      // darkTheme: ThemeData.from(
      //         colorScheme: ColorScheme.fromSwatch(
      //             brightness: Brightness.dark,
      //             backgroundColor: Colors.black,
      //             accentColor: Colors.white,
      //             cardColor: Colors.black))
      //     .copyWith(
      //         // textTheme: const TextTheme(
      //         //     titleMedium:
      //         //         TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //         //     bodyMedium: TextStyle()),
      //         canvasColor: Colors.grey.shade900.withOpacity(0.9),
      //         appBarTheme: const AppBarTheme(
      //             elevation: 0,
      //             titleTextStyle:
      //                 TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      //         snackBarTheme: const SnackBarThemeData(
      //           backgroundColor: Colors.black54,
      //           contentTextStyle: TextStyle(color: Colors.white),
      //         )),
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
  int _selectedIndex = 0;
  final _navigatorKey = GlobalKey<NavigatorState>();

  Map<String, dynamic> routes = {
    '/': const TripsScreen(),
    '/report': const ReportScreen(),
    '/settings': const SettingsScreen(),
    '/calendar': const CalendarScreen(),
    '/customers': const CustomersScreen(),
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
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
      /*bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Einträge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Bericht',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Kalendar',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _navigatorKey.currentState
              ?.popAndPushNamed(routes.keys.toList()[index]);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),*/
      body: ChangeNotifierProvider(
          create: (context) => TripProviderState(),
          child: Navigator(
            key: _navigatorKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (_) => routes[settings.name]);
            },
          )),
    );
  }
}

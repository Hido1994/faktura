import '../customer/customers_screen.dart';
import '../view/screen/calendar_screen.dart';
import '../view/screen/report_screen.dart';
import '../view/screen/settings_screen.dart';
import '../view/screen/trips_screen.dart';

List<Map<String, dynamic>> appRoutes = [
  {
    'title': 'Kunden',
    'component': const CustomersScreen(),
    'route': '/customers'
  },
  {'title': 'Reisen', 'component': const TripsScreen(), 'route': '/'},
  {'title': 'Berichte', 'component': const ReportScreen(), 'route': '/report'},
  {
    'title': 'Einstellungen',
    'component': const SettingsScreen(),
    'route': '/settings'
  },
  {
    'title': 'Stundentafel',
    'component': const CalendarScreen(),
    'route': '/calendar'
  },
];

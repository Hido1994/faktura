import 'package:faktura/account/account_screen.dart';
import 'package:faktura/expense/expense_screen.dart';
import 'package:faktura/paymentmethod/payment_method_screen.dart';
import 'package:faktura/sale/article/sale_article_screen.dart';
import 'package:faktura/supplier/supplier_screen.dart';

import '../customer/customer_screen.dart';
import '../view/screen/calendar_screen.dart';
import '../view/screen/report_screen.dart';
import '../view/screen/settings_screen.dart';
import '../view/screen/trips_screen.dart';

List<Map<String, dynamic>> appRoutes = [
  {
    'title': 'Konten',
    'component': const AccountScreen(),
    'route': '/accounts'
  },
  {
    'title': 'Lieferanten',
    'component': const SupplierScreen(),
    'route': '/suppliers'
  },
  {
    'title': 'Kunden',
    'component': const CustomerScreen(),
    'route': '/customers'
  },
  {
    'title': 'Zahlarten',
    'component': const PaymentMethodScreen(),
    'route': '/payment-methods'
  },
  {
    'title': 'Ausgaben',
    'component': const ExpenseScreen(),
    'route': '/expenses'
  },
  {
    'title': 'Waren',
    'component': const SaleArticleScreen(),
    'route': '/sale-article'
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



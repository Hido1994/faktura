import 'package:faktura/account/account_screen.dart';
import 'package:faktura/expense/expense_screen.dart';
import 'package:faktura/internationalinfo/international_info_screen.dart';
import 'package:faktura/invoice/invoice_screen.dart';
import 'package:faktura/paymentmethod/payment_method_screen.dart';
import 'package:faktura/prepaidtax/prepaid_tax_screen.dart';
import 'package:faktura/sale/article/sale_article_screen.dart';
import 'package:faktura/sale/service/sale_service_screen.dart';
import 'package:faktura/supplier/supplier_screen.dart';
import 'package:faktura/timeentry/time_entry_screen.dart';
import 'package:flutter/material.dart';

import '../customer/customer_screen.dart';
import '../view/screen/report_screen.dart';
import '../view/screen/settings_screen.dart';
import '../view/screen/trips_screen.dart';

List<Map<String, dynamic>> appRoutes = [
  {
    'title': 'Konten',
    'component': const AccountScreen(),
    'route': '/accounts',
    'icon': Icon(Icons.folder),
    'parent': 'Stammdaten'
  },
  {
    'title': 'Lieferanten',
    'component': const SupplierScreen(),
    'route': '/suppliers',
    'icon': Icon(Icons.local_shipping),
    'parent': 'Stammdaten'
  },
  {
    'title': 'Kunden',
    'component': const CustomerScreen(),
    'route': '/customers',
    'icon': Icon(Icons.person),
    'parent': 'Stammdaten'
  },
  {
    'title': 'Zahlarten',
    'component': const PaymentMethodScreen(),
    'route': '/payment-methods',
    'icon': Icon(Icons.payment),
    'parent': 'Stammdaten'
  },
  {
    'title': 'International Info',
    'component': const InternationalInfoScreen(),
    'route': '/international-info',
    'icon': Icon(Icons.airplane_ticket),
    'parent': 'Stammdaten'
  },
  {
    'title': 'Ausgaben',
    'component': const ExpenseScreen(),
    'route': '/expenses',
    'icon': Icon(Icons.payments),
    'parent': 'Bewegung'
  },
  {
    'title': 'Dienstleistungen',
    'component': const SaleServiceScreen(),
    'route': '/sale-service',
    'icon': Icon(Icons.work),
    'parent': 'Bewegung'
  },
  {
    'title': 'Waren',
    'component': const SaleArticleScreen(),
    'route': '/sale-article',
    'icon': Icon(Icons.shopping_cart),
    'parent': 'Bewegung'
  },
  {
    'title': 'Stundentafel',
    'component': const TimeEntryScreen(),
    'route': '/time-entries',
    'icon': Icon(Icons.watch_later),
    'parent': 'Bewegung'
  },
  {
    'title': 'UVA',
    'component': const PrepaidTaxScreen(),
    'route': '/prepaid-taxes',
    'icon': Icon(Icons.calculate),
    'parent': 'Bewegung'
  },
  {
    'title': 'Rechnungen',
    'component': const InvoiceScreen(),
    'route': '/invoices',
    'icon': Icon(Icons.file_copy),
    'parent': 'Bewegung'
  },
  {
    'title': 'Reisen',
    'component': const TripsScreen(),
    'route': '/',
    'icon': Icon(Icons.folder),
  },
  {
    'title': 'Berichte',
    'component': const ReportScreen(),
    'route': '/report',
    'icon': Icon(Icons.folder),
  },
  {
    'title': 'Einstellungen',
    'component': const SettingsScreen(),
    'route': '/settings',
    'icon': Icon(Icons.folder),
  },
];

Map<String, List<Map<String, dynamic>>> getGroupedRoutes(
    List<Map<String, dynamic>> routes) {
  final Map<String, List<Map<String, dynamic>>> groupedRoutes = {};

  for (var route in routes) {
    final parent = route['parent'] ?? 'Other';

    if (!groupedRoutes.containsKey(parent)) {
      groupedRoutes[parent] = [];
    }

    groupedRoutes[parent]!.add(route);
  }

  return groupedRoutes;
}

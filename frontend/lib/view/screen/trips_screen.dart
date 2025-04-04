import 'package:faktura/service/trip_service.dart';
import 'package:faktura/state/trip_provider_state.dart';
import 'package:faktura/view/screen/form_screen.dart';
import 'package:faktura/common/widget/trip_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/widget/custom_drawer.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _MyTripsScreen();
}

class _MyTripsScreen extends State<TripsScreen> {
  TripService tripService = TripService.instance;

  @override
  void initState() {
    super.initState();
    Provider.of<TripProviderState>(context, listen: false).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
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
      drawer: CustomDrawer(),
      body: Consumer<TripProviderState>(builder: (context, state, child) {
        return ListView.separated(
          padding: const EdgeInsets.only(top: 20),
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return TripListItem(entry: state.trips[index]);
          },
          itemCount: state.trips.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FormScreen()));
        },
        tooltip: 'Neu',
        child: const Icon(Icons.add),
      ),
    );
  }
}

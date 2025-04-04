import 'package:faktura/persistence/model/trip.dart';
import 'package:faktura/service/trip_service.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/trip_provider_state.dart';

class CustomerFormScreen extends StatefulWidget {
  final int? entryId;

  const CustomerFormScreen({super.key, this.entryId});

  @override
  State<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  TripService tripService = TripService.instance;

  Trip trip = Trip();

  List<String> vehicles = [];
  List<String> reasons = [];
  List<String> locations = [];
  List<String> types = [];

  Future<void> _initTrip() async {
    DateTime now = DateTime.now();
    now = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    now = now.subtract(Duration(seconds: now.second));

    List<String> vehicles = await tripService.getVehicles();
    List<String> reasons = await tripService.getReasons();
    List<String> locations = await tripService.getLocations();
    List<String> types = await tripService.getTypes();

    Customer customer = Customer();

    if (widget.entryId == null) {
      trip.startDate = now;

      if (reasons.isNotEmpty) {
        trip.reason = reasons[0];
      }
      if (vehicles.isNotEmpty) {
        trip.vehicle = vehicles[0];
      }
      if (types.isNotEmpty) {
        trip.type = types[0];
      }

      trip.startMileage = await tripService.getLastEndMileage(trip.vehicle);
      trip.startLocation = await tripService.getLastEndLocation();
    } else {
      trip = await tripService.getById(widget.entryId!);
    }

    if (this.trip.endDate == null) {
      trip.endDate = now;
      if (trip.endLocation == null && trip.parent != null) {
        Trip parent = await tripService.getById(trip.parent!);
        trip.endLocation = parent.startLocation;

        if (trip.endLocation != null &&
            trip.startLocation != null &&
            trip.startMileage != null &&
            trip.endMileage == null) {
          tripService
              .getLastTripDistance(trip.startLocation, trip.endLocation)
              .then((value) => setState(() {
                    trip.endMileage = (trip.startMileage! + value!);
                  }));
        }
      }
    }

    setState(() {
      this.trip = trip;
      this.vehicles = vehicles;
      this.reasons = reasons;
      this.locations = locations;
      this.types = types;
    });
  }

  @override
  void initState() {
    super.initState();

    _initTrip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.entryId == null ? "Neu" : "Bearbeiten")),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AutocompleteTextFormField(
                    key: UniqueKey(),
                    title: 'Name',
                    options: [],
                    initialValue: trip.type,
                    onChanged: (value) {
                      trip.type = value;
                    }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            tripService.save(trip).then((value) {
              Provider.of<TripProviderState>(context, listen: false).refresh();

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Saved'),
                behavior: SnackBarBehavior.floating,
              ));
              Navigator.pop(context);
            });
          }
        },
        tooltip: 'Speichern',
        child: const Icon(Icons.check),
      ),
    );
  }
}

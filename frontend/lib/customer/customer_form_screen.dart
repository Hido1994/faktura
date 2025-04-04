import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/customer/customers_model.dart';
import 'package:faktura/persistence/model/trip.dart';
import 'package:faktura/service/trip_service.dart';
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

  CustomerBuilder entity = CustomerBuilder();

  Future<void> _initCustomer() async {
    CustomerBuilder entity = CustomerBuilder();

    if (widget.entryId == null) {
    } else {
      entity = await Provider.of<CustomerApi>(context, listen: false)
          .getCustomerById(id: widget.entryId!)
          .then((response) => response.data!.toBuilder());
    }

    setState(() {
      this.entity = entity;
    });
  }

  @override
  void initState() {
    super.initState();

    _initCustomer();
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
                    initialValue: entity.name,
                    onChanged: (value) {
                      entity.name = value;
                    }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Provider.of<CustomerApi>(context, listen: false).saveCustomer(customer: entity.build()).then((response) {
              Provider.of<CustomersModel>(context, listen: false).getAll();

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

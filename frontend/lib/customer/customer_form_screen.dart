import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/customer/customer_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerFormScreen extends StatefulWidget {
  final Customer? entry;

  const CustomerFormScreen({super.key, this.entry});

  @override
  State<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();

  CustomerBuilder builder = CustomerBuilder();

  Future<void> _initCustomer() async {
    CustomerBuilder entityBuilder = CustomerBuilder();

    if (widget.entry == null) {
    } else {
      entityBuilder = widget.entry!.toBuilder();
    }

    setState(() {
      builder = entityBuilder;
    });
  }

  @override
  void initState() {
    super.initState();

    _initCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Bottom sheet title
              Text(
                widget.entry?.id == null ? "Erstellen" : "Bearbeiten",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Name',
                options: [],
                initialValue: builder.name,
                onChanged: (value) {
                  builder.name = value;
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<CustomerModel>(context, listen: false)
                        .save(builder.build())
                        .then((response) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Gespeichert'),
                        behavior: SnackBarBehavior.floating,
                      ));
                      Navigator.pop(context);
                    });
                  }
                },
                icon: Icon(Icons.check),
                label: Text('Speichern'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

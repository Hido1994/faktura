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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Adresszeile 1',
                options: [],
                initialValue: builder.addressLine1,
                onChanged: (value) {
                  builder.addressLine1 = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Adresszeile 2',
                options: [],
                initialValue: builder.addressLine2,
                onChanged: (value) {
                  builder.addressLine2 = value;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Stadt',
                options: [],
                initialValue: builder.city,
                onChanged: (value) {
                  builder.city = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'PLZ',
                options: [],
                initialValue: builder.postalCode,
                onChanged: (value) {
                  builder.postalCode = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'UID',
                options: [],
                initialValue: builder.taxIdentificationNumber,
                onChanged: (value) {
                  builder.taxIdentificationNumber = value;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'E-Mail',
                options: [],
                initialValue: builder.email,
                onChanged: (value) {
                  builder.email = value;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Telefon',
                options: [],
                initialValue: builder.phone,
                onChanged: (value) {
                  builder.phone = value;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Stundensatz',
                  options: const [],
                  initialValue: builder.hourlyRate?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    builder.hourlyRate = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Ländercode',
                options: [],
                initialValue: builder.countryCode,
                onChanged: (value) {
                  builder.countryCode = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Zahlungsbedingung',
                options: [],
                initialValue: builder.paymentInfo,
                onChanged: (value) {
                  builder.paymentInfo = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Provider.of<CustomerModel>(context, listen: false)
                          .save(builder.build())
                          .then((response) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Gespeichert'),
                          behavior: SnackBarBehavior.floating,
                        ));
                        Navigator.pop(context);
                      });
                    } catch (e) {
                      print('Unexpected error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Ein unerwarteter Fehler ist aufgetreten.'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Objekt konnte nicht gespeichert werden.'),
                      behavior: SnackBarBehavior.floating,
                    ));
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

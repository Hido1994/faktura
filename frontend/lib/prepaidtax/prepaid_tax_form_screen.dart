import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/prepaidtax/prepaid_tax_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PrepaidTaxFormScreen extends StatefulWidget {
  final PrepaidTax? entry;

  const PrepaidTaxFormScreen({super.key, this.entry});

  @override
  State<PrepaidTaxFormScreen> createState() => _PrepaidTaxFormScreenState();
}

class _PrepaidTaxFormScreenState extends State<PrepaidTaxFormScreen> {
  final _formKey = GlobalKey<FormState>();

  PrepaidTaxBuilder builder = PrepaidTaxBuilder();

  Future<void> _initPrepaidTax() async {
    PrepaidTaxBuilder entityBuilder = PrepaidTaxBuilder();

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

    _initPrepaidTax();
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
                title: 'Jahr',
                options: const [],
                initialValue: builder.taxYear?.toString(),
                textInputType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  builder.taxYear = int.tryParse(value);
                },
                validator: (value) {
                  if (value == null) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Quartal',
                options: const [],
                initialValue: builder.taxQuarter?.toString(),
                textInputType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  builder.taxQuarter = int.tryParse(value);
                },
                validator: (value) {
                  if (value == null) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Steuerkonto Guthaben',
                  options: const [],
                  initialValue: builder.accountSurplus?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.accountSurplus = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Steuerkonto Vorsteuer',
                  options: const [],
                  initialValue: builder.taxCalculated?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.taxCalculated = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Überweisung',
                  options: const [],
                  initialValue: builder.cashTransfer?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.cashTransfer = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Notiz',
                options: [],
                initialValue: builder.note,
                onChanged: (value) {
                  builder.note = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Provider.of<PrepaidTaxModel>(context, listen: false)
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

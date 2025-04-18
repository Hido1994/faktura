import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/widget/datetime_picker_text_form_field.dart';
import '../customer/customer_model.dart';

class TimeEntryFormScreen extends StatefulWidget {
  final TimeEntry? entry;

  const TimeEntryFormScreen({super.key, this.entry});

  @override
  State<TimeEntryFormScreen> createState() => _TimeEntryFormScreenState();
}

class _TimeEntryFormScreenState extends State<TimeEntryFormScreen> {
  final _formKey = GlobalKey<FormState>();

  TimeEntryBuilder builder = TimeEntryBuilder();

  Future<void> _initTimeEntry() async {
    TimeEntryBuilder entityBuilder = TimeEntryBuilder();

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

    _initTimeEntry();
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
              DateTimePickerTextFormField(
                key: UniqueKey(),
                title: 'Von',
                initialValue: builder.startedOn,
                includeTime: false,
                onChanged: (date) {
                  builder.startedOn = date;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DateTimePickerTextFormField(
                key: UniqueKey(),
                title: 'Bis',
                initialValue: builder.endedOn,
                includeTime: false,
                onChanged: (date) {
                  builder.endedOn = date;
                },
                validator: (value) {
                  if (builder.endedOn != null &&
                      builder.startedOn != null &&
                      builder.endedOn!.isBefore(builder.startedOn!)) {
                    return "Bis-Zeit muss vor der Von-Zeit liegen";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Consumer<CustomerModel>(builder: (context, model, child) {
                return DropdownSearch<Customer>(
                  items: (f, cs) => model.entities,
                  selectedItem: builder.customer.id != null
                      ? builder.customer.build()
                      : null,
                  itemAsString: (Customer customer) => customer.name,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Kunde"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.customer = value?.toBuilder();
                  },
                  filterFn: (Customer customer, String filter) {
                    return customer.name
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Beschreibung',
                options: [],
                initialValue: builder.description,
                onChanged: (value) {
                  builder.description = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Provider.of<TimeEntryModel>(context, listen: false)
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

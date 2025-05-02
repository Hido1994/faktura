import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/widget/datetime_picker_text_form_field.dart';
import '../customer/customer_model.dart';

class TimeEntryFormScreen extends StatefulWidget {
  final TimeEntryBuilder? entry;

  const TimeEntryFormScreen({super.key, this.entry});

  @override
  State<TimeEntryFormScreen> createState() => _TimeEntryFormScreenState();
}

class _TimeEntryFormScreenState extends State<TimeEntryFormScreen> {
  final _formKey = GlobalKey<FormState>();

  TimeEntryBuilder builder = TimeEntryBuilder();

  Future<void> _initTimeEntry() async {
    setState(() {
      builder = widget.entry ?? TimeEntryBuilder();
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
                initialValue: builder.startedOn?.toLocal(),
                includeTime: true,
                onChanged: (date) {
                  builder.startedOn = date.toUtc();
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
                initialValue: builder.endedOn?.toLocal(),
                defaultCurrentTime: builder.startedOn?.toLocal(),
                includeTime: true,
                onChanged: (date) {
                  builder.endedOn = date.toUtc();
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
                  items: (f, cs) => model.lovEntities,
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
                  validator: (value) {
                    if (value == null) {
                      return "Muss angegeben werden";
                    }
                    return null;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
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
                              content: Text(
                                  'Ein unerwarteter Fehler ist aufgetreten.'),
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Objekt konnte nicht gespeichert werden.'),
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Speichern'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
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
                              content: Text(
                                  'Ein unerwarteter Fehler ist aufgetreten.'),
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Objekt konnte nicht gespeichert werden.'),
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      },
                      icon: Icon(Icons.delete),
                      label: Text('Löschen'),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

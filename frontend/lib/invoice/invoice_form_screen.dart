import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/invoice/invoice_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../common/widget/datetime_picker_text_form_field.dart';
import '../customer/customer_model.dart';
import '../paymentmethod/payment_method_model.dart';

class InvoiceFormScreen extends StatefulWidget {
  final InvoiceBuilder? entry;

  const InvoiceFormScreen({super.key, this.entry});

  @override
  State<InvoiceFormScreen> createState() => _InvoiceFormScreenState();
}

class _InvoiceFormScreenState extends State<InvoiceFormScreen> {
  final _formKey = GlobalKey<FormState>();

  InvoiceBuilder builder = InvoiceBuilder();

  Future<void> _initInvoice() async {
    InvoiceBuilder entityBuilder = InvoiceBuilder();

    if (widget.entry == null) {
    } else {
      entityBuilder = widget.entry!;
    }

    setState(() {
      builder = entityBuilder;
    });
  }

  @override
  void initState() {
    super.initState();

    _initInvoice();
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
                title: 'Erstellt am',
                initialValue: builder.createdOn?.toDateTime(),
                includeTime: false,
                onChanged: (date) {
                  builder.createdOn = date.toDate();
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
                title: 'Rechnungs-Nr.',
                options: const [],
                initialValue: builder.invoiceNumber?.toString(),
                textInputType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  builder.invoiceNumber = int.tryParse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
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
                );
              }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Betreff',
                options: [],
                initialValue: builder.subject,
                onChanged: (value) {
                  builder.subject = value;
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
                title: 'Leistungszeitraum',
                options: [],
                initialValue: builder.servicePeriod,
                onChanged: (value) {
                  builder.servicePeriod = value;
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Revision',
                options: [],
                initialValue: builder.revision,
                onChanged: (value) {
                  builder.revision = value;
                },
              ),
              const SizedBox(height: 20),
              DateTimePickerTextFormField(
                key: UniqueKey(),
                title: 'Bezahlt am',
                initialValue: builder.paidOn?.toDateTime(),
                includeTime: false,
                onChanged: (date) {
                  builder.paidOn = date.toDate();
                },
              ),
              const SizedBox(height: 20),
              Consumer<PaymentMethodModel>(builder: (context, model, child) {
                return DropdownSearch<PaymentMethod>(
                  items: (f, cs) => model.lovEntities,
                  selectedItem: builder.paymentMethod.id != null
                      ? builder.paymentMethod.build()
                      : null,
                  itemAsString: (PaymentMethod entity) => entity.description,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Zahlart"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.paymentMethod = value?.toBuilder();
                  },
                  filterFn: (PaymentMethod entity, String filter) {
                    return entity.description
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
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Provider.of<InvoiceModel>(context, listen: false)
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

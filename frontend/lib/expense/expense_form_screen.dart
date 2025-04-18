import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/expense/expense_model.dart';
import 'package:faktura/supplier/supplier_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../account/account_model.dart';
import '../common/widget/datetime_picker_text_form_field.dart';
import '../internationalinfo/international_info_model.dart';
import '../paymentmethod/payment_method_model.dart';

class ExpenseFormScreen extends StatefulWidget {
  final Expense? entry;

  const ExpenseFormScreen({super.key, this.entry});

  @override
  State<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends State<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();

  ExpenseBuilder builder = ExpenseBuilder();

  Future<void> _initExpense() async {
    ExpenseBuilder entityBuilder = ExpenseBuilder();

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

    _initExpense();
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
                title: 'Eingang am',
                initialValue: builder.incomingOn?.toDateTime(),
                includeTime: false,
                onChanged: (date) {
                  builder.incomingOn = date.toDate();
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
                title: 'Bezahlt am',
                initialValue: builder.paidOn?.toDateTime(),
                includeTime: false,
                onChanged: (date) {
                  builder.paidOn = date.toDate();
                },
              ),
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
              Consumer<AccountModel>(builder: (context, model, child) {
                return DropdownSearch<Account>(
                  items: (f, cs) => model.entities,
                  selectedItem: builder.account.id != null
                      ? builder.account.build()
                      : null,
                  itemAsString: (Account account) => account.description,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Konto"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.account = value?.toBuilder();
                  },
                  filterFn: (Account account, String filter) {
                    return account.description
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              Consumer<SupplierModel>(builder: (context, model, child) {
                return DropdownSearch<Supplier>(
                  items: (f, cs) => model.entities,
                  selectedItem: builder.supplier.id != null
                      ? builder.supplier.build()
                      : null,
                  itemAsString: (Supplier entity) => entity.name,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Lieferant"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.supplier = value?.toBuilder();
                  },
                  filterFn: (Supplier entity, String filter) {
                    return entity.name
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              Consumer<InternationalInfoModel>(
                  builder: (context, model, child) {
                return DropdownSearch<InternationalInfo>(
                  items: (f, cs) => model.entities,
                  selectedItem: builder.internationalInfo.id != null
                      ? builder.internationalInfo.build()
                      : null,
                  itemAsString: (InternationalInfo entity) =>
                      entity.description,
                  decoratorProps: DropDownDecoratorProps(
                      decoration:
                          InputDecoration(label: Text("International Info"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.internationalInfo = value?.toBuilder();
                  },
                  filterFn: (InternationalInfo entity, String filter) {
                    return entity.description
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              Consumer<PaymentMethodModel>(builder: (context, model, child) {
                return DropdownSearch<PaymentMethod>(
                  items: (f, cs) => model.entities,
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
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Netto',
                  options: const [],
                  initialValue: builder.priceNet?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.priceNet = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Ust.',
                  options: const [],
                  initialValue: builder.priceTax?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.priceTax = double.tryParse(value);
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
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'AFA-Jahre',
                  options: const [],
                  initialValue: builder.depreciationYears?.toString(),
                  textInputType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    builder.depreciationYears = int.tryParse(value);
                  }),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Provider.of<ExpenseModel>(context, listen: false)
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

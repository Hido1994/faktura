import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/expense/expense_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../account/account_model.dart';
import '../common/widget/datetime_picker_text_form_field.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AccountModel>(context, listen: false).getAll();
    });
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
                title: 'Description',
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
                  itemAsString: (Account account) => account.description,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Konto"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  popupProps: PopupProps.menu(
                      showSearchBox: true,
                      fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.account = value?.toBuilder();
                  },
                  filterFn: (Account account, String filter) {
                    return account.description.toLowerCase().contains(filter.toLowerCase());
                  },
                );
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

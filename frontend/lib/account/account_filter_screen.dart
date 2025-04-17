import 'package:faktura/account/account_model.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFilterScreen extends StatefulWidget {
  const AccountFilterScreen({super.key});

  @override
  State<AccountFilterScreen> createState() => _AccountFilterScreenState();
}

class _AccountFilterScreenState extends State<AccountFilterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountModel>(builder: (context, model, child) {
      return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Filter",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                AutocompleteTextFormField(
                    key: UniqueKey(),
                    title: 'Beschreibung',
                    options: [],
                    initialValue: model.filter.description,
                    onChanged: (value) {
                      model.filter.description = value;
                    }),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<AccountModel>(context, listen: false)
                          .refresh();
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(Icons.filter_alt),
                  label: Text('Anwenden'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

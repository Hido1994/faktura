import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/customer/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerFilterScreen extends StatefulWidget {
  const CustomerFilterScreen({super.key});

  @override
  State<CustomerFilterScreen> createState() => _CustomerFilterScreenState();
}

class _CustomerFilterScreenState extends State<CustomerFilterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerModel>(builder: (context, model, child) {
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
                    title: 'Name',
                    options: [],
                    initialValue: model.filter.name,
                    onChanged: (value) {
                      model.filter.name = value;
                    }),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<CustomerModel>(context, listen: false)
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

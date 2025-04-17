import 'package:faktura/paymentmethod/payment_method_model.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodFilterScreen extends StatefulWidget {
  const PaymentMethodFilterScreen({super.key});

  @override
  State<PaymentMethodFilterScreen> createState() => _PaymentMethodFilterScreenState();
}

class _PaymentMethodFilterScreenState extends State<PaymentMethodFilterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodModel>(builder: (context, model, child) {
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
                      Provider.of<PaymentMethodModel>(context, listen: false)
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

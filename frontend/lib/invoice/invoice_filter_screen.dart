import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/invoice/invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InvoiceFilterScreen extends StatefulWidget {
  const InvoiceFilterScreen({super.key});

  @override
  State<InvoiceFilterScreen> createState() => _InvoiceFilterScreenState();
}

class _InvoiceFilterScreenState extends State<InvoiceFilterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceModel>(builder: (context, model, child) {
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
                  title: 'Rechnungs-Nr.',
                  options: const [],
                  initialValue: model.filter.invoiceNumber.toString(),
                  textInputType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    model.filter.invoiceNumber = int.tryParse(value);
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<InvoiceModel>(context, listen: false)
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

import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/supplier/supplier_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupplierFilterScreen extends StatefulWidget {
  const SupplierFilterScreen({super.key});

  @override
  State<SupplierFilterScreen> createState() => _SupplierFilterScreenState();
}

class _SupplierFilterScreenState extends State<SupplierFilterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SupplierModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Filter"),
            ),
            body: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      AutocompleteTextFormField(
                          key: UniqueKey(),
                          title: 'Name',
                          options: [],
                          initialValue: model.filter.name,
                          onChanged: (value) {
                            model.filter.name = value;
                          }),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Provider.of<SupplierModel>(context, listen: false).refresh();
                  Navigator.pop(context);
                }
              },
              child: const Icon(Icons.filter_alt),
            ),
          );
        }
    );
  }
}

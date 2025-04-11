import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/supplier/supplier_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupplierFormScreen extends StatefulWidget {
  final Supplier? entry;

  const SupplierFormScreen({super.key, this.entry});

  @override
  State<SupplierFormScreen> createState() => _SupplierFormScreenState();
}

class _SupplierFormScreenState extends State<SupplierFormScreen> {
  final _formKey = GlobalKey<FormState>();

  SupplierBuilder builder = SupplierBuilder();

  Future<void> _initSupplier() async {
    SupplierBuilder entityBuilder = SupplierBuilder();

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

    _initSupplier();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry?.id == null ? "Neu" : "Bearbeiten"),
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
                    initialValue: builder.name,
                    onChanged: (value) {
                      builder.name = value;
                    }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Provider.of<SupplierModel>(context, listen: false)
                .save(builder.build())
                .then((response) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Saved'),
                behavior: SnackBarBehavior.floating,
              ));
              Navigator.pop(context);
            });
          }
        },
        tooltip: 'Speichern',
        child: const Icon(Icons.check),
      ),
    );
  }
}

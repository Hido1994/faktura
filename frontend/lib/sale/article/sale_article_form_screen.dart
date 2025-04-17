import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/sale/article/sale_article_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/widget/datetime_picker_text_form_field.dart';

class SaleArticleFormScreen extends StatefulWidget {
  final SaleArticle? entry;

  const SaleArticleFormScreen({super.key, this.entry});

  @override
  State<SaleArticleFormScreen> createState() => _SaleArticleFormScreenState();
}

class _SaleArticleFormScreenState extends State<SaleArticleFormScreen> {
  final _formKey = GlobalKey<FormState>();

  SaleArticleBuilder builder = SaleArticleBuilder();

  Future<void> _initSaleArticle() async {
    SaleArticleBuilder entityBuilder = SaleArticleBuilder();

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

    _initSaleArticle();
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
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Provider.of<SaleArticleModel>(context, listen: false)
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

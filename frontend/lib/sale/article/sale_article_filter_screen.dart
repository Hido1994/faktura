import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/sale/article/sale_article_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaleArticleFilterScreen extends StatefulWidget {
  const SaleArticleFilterScreen({super.key});

  @override
  State<SaleArticleFilterScreen> createState() =>
      _SaleArticleFilterScreenState();
}

class _SaleArticleFilterScreenState extends State<SaleArticleFilterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SaleArticleModel>(builder: (context, model, child) {
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
                      Provider.of<SaleArticleModel>(context, listen: false)
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

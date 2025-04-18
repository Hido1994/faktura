import 'package:faktura/preference/preference_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/widget/autocomplete_text_form_field.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<PreferenceScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'API-URL',
                options: [],
                initialValue:
                    Provider.of<PreferenceModel>(context, listen: false).apiUrl,
                onChanged: (value) {
                  Provider.of<PreferenceModel>(context, listen: false)
                      .setApiUrl(value);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

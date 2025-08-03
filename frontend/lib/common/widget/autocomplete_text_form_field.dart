import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AutocompleteTextFormField extends StatefulWidget {
  final String? initialValue;
  final String title;
  final List<String> options;
  final ValueSetter<String> onChanged;
  final ValueSetter<String>? onSelected;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FormFieldValidator<String>? validator;

  const AutocompleteTextFormField(
      {super.key,
      required this.title,
      required this.options,
      required this.onChanged,
      this.onSelected,
      this.initialValue,
      this.textInputType = TextInputType.text,
      this.inputFormatter,
      this.validator});

  @override
  State<AutocompleteTextFormField> createState() =>
      _AutocompleteTextFormFieldState();
}

class _AutocompleteTextFormFieldState extends State<AutocompleteTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void didUpdateWidget(AutocompleteTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != oldWidget.initialValue) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      initialValue: TextEditingValue(text: widget.initialValue ?? ''),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return widget.options;
        } else {
          return widget.options.where((String option) {
            return option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
        }
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        if (fieldTextEditingController.text != _controller.text) {
          fieldTextEditingController.text = _controller.text;
        }
        return TextFormField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          onChanged: (value) {
            _controller.text = value;
            widget.onChanged(value);
          },
          inputFormatters: widget.inputFormatter,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(label: Text(widget.title)),
          validator: widget.validator,
        );
      },
      onSelected: (String selection) {
        _controller.text = selection;
        if (widget.onSelected != null) {
          widget.onSelected!(selection);
        } else {
          widget.onChanged(selection);
        }
      },
    );
  }
}

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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _controller.text = widget.initialValue ?? '';
        }
      });
    }
  }

  void _syncControllers(TextEditingController fieldController) {
    if (fieldController.text != _controller.text) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && fieldController.text != _controller.text) {
          fieldController.text = _controller.text;
        }
      });
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
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Card(
            margin: const EdgeInsets.only(top: 4),
            elevation: 4,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 200,
                maxWidth: MediaQuery.of(context).size.width - 32,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    dense: true,
                    title: Text(option),
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
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
        _syncControllers(fieldTextEditingController);
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _controller.text = selection;
            if (widget.onSelected != null) {
              widget.onSelected!(selection);
            } else {
              widget.onChanged(selection);
            }
          }
        });
      },
    );
  }
}

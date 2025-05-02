import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../string_formats.dart';

class DateTimePickerTextFormField extends StatefulWidget {
  final DateTime? initialValue;
  final DateTime? defaultCurrentTime;
  final String title;
  final ValueSetter<DateTime> onChanged;
  final FormFieldValidator<String>? validator;
  final bool includeTime;

  const DateTimePickerTextFormField(
      {super.key,
      required this.title,
      required this.onChanged,
      this.initialValue,
      this.defaultCurrentTime,
      this.validator,
      this.includeTime = true});

  @override
  State<DateTimePickerTextFormField> createState() =>
      _DateTimePickerTextFormFieldState();
}

class _DateTimePickerTextFormFieldState
    extends State<DateTimePickerTextFormField> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      if (widget.includeTime) {
        _dateController.text = dateTimeFormat.format(widget.initialValue!);
      } else {
        _dateController.text = dateFormat.format(widget.initialValue!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(label: Text(widget.title)),
      readOnly: true,
      controller: _dateController,
      onTap: () {
        if (widget.includeTime) {
          DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            onConfirm: (date) {
              widget.onChanged(date);
              _dateController.text = dateTimeFormat.format(date);
            },
            currentTime: _dateController.text.isEmpty
                ? widget.defaultCurrentTime
                : dateTimeFormat.parse(_dateController.text),
            locale: LocaleType.de,
          );
        } else {
          DatePicker.showDatePicker(
            context,
            showTitleActions: true,
            onConfirm: (date) {
              widget.onChanged(date);
              _dateController.text = dateFormat.format(date);
            },
            currentTime: _dateController.text.isEmpty
                ? widget.defaultCurrentTime
                : dateTimeFormat.parse(_dateController.text),
            locale: LocaleType.de,
          );
        }
      },
      validator: widget.validator,
    );
  }
}

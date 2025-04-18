import 'package:faktura/common/string_formats.dart';
import 'package:faktura/timeentry/time_entry_form_screen.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeEntryListItem extends StatefulWidget {
  final TimeEntry entry;

  const TimeEntryListItem({super.key, required this.entry});

  @override
  State<TimeEntryListItem> createState() => _TimeEntryListItem();
}

class _TimeEntryListItem extends State<TimeEntryListItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ObjectKey(widget.entry.id),
        background: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          color: Colors.green,
          child: const Icon(Icons.add),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          color: Colors.red,
          child: const Icon(Icons.delete),
        ),
        confirmDismiss: (direction) async {
          if (DismissDirection.endToStart == direction) {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Löschen"),
                  content: const Text("Sind Sie sicher?"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Löschen")),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("Abbrechen"),
                    ),
                  ],
                );
              },
            );
          } else {
            TimeEntryBuilder builder = widget.entry.toBuilder();
            builder.id = null;
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) => TimeEntryFormScreen(
                entry: builder.build(),
              ),
            );
            return false;
          }
        },
        onDismissed: (direction) {
          if (DismissDirection.endToStart == direction) {
            Provider.of<TimeEntryModel>(context, listen: false)
                .delete(widget.entry.id!)
                .then((response) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Gelöscht'),
                behavior: SnackBarBehavior.floating,
              ));
            });
          }
        },
        child: ListTile(
          leading: Icon(Icons.watch_later),
          title: Text(
            '${dateTimeFormat.format(widget.entry.startedOn)} - ${widget.entry.endedOn != null ? dateTimeFormat.format(widget.entry.endedOn!) : '?'} - ${widget.entry.description}',
          ),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) => TimeEntryFormScreen(
                entry: widget.entry,
              ),
            );
          },
        ));
  }
}

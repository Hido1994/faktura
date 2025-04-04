import 'package:faktura/customer/customer_form_screen.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';

import '../common/string_formats.dart';

class CustomerListItem extends StatefulWidget {
  final Customer entry;

  const CustomerListItem({super.key, required this.entry});

  @override
  State<CustomerListItem> createState() => _CustomerListItem();
}

class _CustomerListItem extends State<CustomerListItem> {
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
          }
        },
        onDismissed: (direction) {
          if (DismissDirection.endToStart == direction) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('TODO!'),
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text(
            widget.entry.name,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.entry.taxIdentificationNumber!),
              Text(widget.entry.addressLine1),
              Text(currencyFormat.format(widget.entry.hourlyRate)),
            ],
          ),
          isThreeLine: true,
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) =>
                  CustomerFormScreen(
                    entry: widget.entry,
                  ),
            );
          },
        ));
  }
}

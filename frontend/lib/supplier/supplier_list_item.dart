import 'package:faktura/supplier/supplier_form_screen.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';

import '../common/string_formats.dart';

class SupplierListItem extends StatefulWidget {
  final Supplier entry;

  const SupplierListItem({super.key, required this.entry});

  @override
  State<SupplierListItem> createState() => _SupplierListItem();
}

class _SupplierListItem extends State<SupplierListItem> {
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
          leading: Icon(Icons.local_shipping),
          title: Text(
            widget.entry.name,
          ),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) => SupplierFormScreen(
                entry: widget.entry,
              ),
            );
          },
        ));
  }
}

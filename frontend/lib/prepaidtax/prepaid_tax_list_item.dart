import 'package:faktura/prepaidtax/prepaid_tax_form_screen.dart';
import 'package:faktura/prepaidtax/prepaid_tax_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrepaidTaxListItem extends StatefulWidget {
  final PrepaidTax entry;

  const PrepaidTaxListItem({super.key, required this.entry});

  @override
  State<PrepaidTaxListItem> createState() => _PrepaidTaxListItem();
}

class _PrepaidTaxListItem extends State<PrepaidTaxListItem> {
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
            PrepaidTaxBuilder builder = widget.entry.toBuilder();
            builder.id = null;
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) => PrepaidTaxFormScreen(
                entry: builder.build(),
              ),
            );
            return false;
          }
        },
        onDismissed: (direction) {
          if (DismissDirection.endToStart == direction) {
            Provider.of<PrepaidTaxModel>(context, listen: false)
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
          leading: Icon(Icons.calculate),
          title: Text(
            '${widget.entry.taxYear.toString()} - ${widget.entry.taxQuarter.toString()}'
          ),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) => PrepaidTaxFormScreen(
                entry: widget.entry,
              ),
            );
          },
        ));
  }
}

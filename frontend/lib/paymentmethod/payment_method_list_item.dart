import 'package:faktura/paymentmethod/payment_method_form_screen.dart';
import 'package:faktura/paymentmethod/payment_method_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodListItem extends StatefulWidget {
  final PaymentMethod entry;

  const PaymentMethodListItem({super.key, required this.entry});

  @override
  State<PaymentMethodListItem> createState() => _PaymentMethodListItem();
}

class _PaymentMethodListItem extends State<PaymentMethodListItem> {
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
          return null;
        },
        onDismissed: (direction) {
          if (DismissDirection.endToStart == direction) {
            Provider.of<PaymentMethodModel>(context, listen: false)
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
          leading: Icon(Icons.payment),
          title: Text(
            widget.entry.description,
          ),
          isThreeLine: false,
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) => PaymentMethodFormScreen(
                entry: widget.entry,
              ),
            );
          },
        ));
  }
}

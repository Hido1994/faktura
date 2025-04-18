import 'package:faktura/sale/article/sale_article_form_screen.dart';
import 'package:faktura/sale/article/sale_article_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaleArticleListItem extends StatefulWidget {
  final SaleArticle entry;

  const SaleArticleListItem({super.key, required this.entry});

  @override
  State<SaleArticleListItem> createState() => _SaleArticleListItem();
}

class _SaleArticleListItem extends State<SaleArticleListItem> {
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
            SaleArticleBuilder builder = widget.entry.toBuilder();
            builder.id = null;
            showModalBottomSheet(
              isScrollControlled: true,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              builder: (context) => SaleArticleFormScreen(
                entry: builder,
              ),
            );
            return false;
          }
        },
        onDismissed: (direction) {
          if (DismissDirection.endToStart == direction) {
            Provider.of<SaleArticleModel>(context, listen: false)
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
          leading: Icon(Icons.shopping_cart),
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
              builder: (context) => SaleArticleFormScreen(
                entry: widget.entry.toBuilder(),
              ),
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_drawer.dart';

class CustomListScreen extends StatelessWidget {
  final String title;
  final Widget form;
  final Consumer consumer;

  const CustomListScreen(
      {super.key,
      required this.title,
      required this.form,
      required this.consumer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: CustomDrawer(),
      body: consumer,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => form));
        },
        tooltip: 'Neu',
        child: const Icon(Icons.add),
      ),
    );
  }
}

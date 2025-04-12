import 'package:flutter/material.dart';

import 'custom_drawer.dart';

class CustomScreen extends StatelessWidget {
  final String title;
  final Widget? form;
  final Widget? filter;
  final Widget body;

  const CustomScreen(
      {super.key,
      required this.title,
      this.form,
      this.filter,
      required this.body});

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
        actions: filter != null
            ? [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: ()  {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      showDragHandle: true,
                      useSafeArea: true,
                      context: context,
                      builder: (context) => filter!,
                    );
                  },
                  tooltip: 'Filter',
                ),
              ]
            : [],
      ),
      drawer: CustomDrawer(),
      body: body,
      floatingActionButton: form != null
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  showDragHandle: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => form!,
                );
              },
              tooltip: 'Neu',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

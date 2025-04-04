import 'package:faktura/common/app_routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ...appRoutes.map((item) => ListTile(
                title: Text(item['title']),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(item['route']);
                },
              )),
        ],
      ),
    ));
  }
}

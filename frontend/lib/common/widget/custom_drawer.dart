import 'package:faktura/common/app_routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: ListView(
              padding: EdgeInsets.zero,
              children: [
              ...getGroupedRoutes(appRoutes).entries.expand((entry) { return [
                ListTile(
                  title: Text(
                    entry.key,
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ),
                ...entry.value.map((item) =>
                    ListTile(
                      title: Text(item['title']),
                      leading: item['icon'],
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(item['route']);
                      },
                    )),
              ]; }),
            ],
          ),
        ));
  }
}

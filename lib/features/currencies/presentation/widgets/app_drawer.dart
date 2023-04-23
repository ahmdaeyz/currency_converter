import 'package:currency_converter/features/settings/presentation/pages/settings_page.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.currency_exchange,
            color: Theme.of(context).primaryColor,
            size: 48.h,
          )),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
            title: Text(
              S.of(context).settings,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wildersmerch/navigation/navigators.dart';
import 'package:wildersmerch/navigation/routes.dart';

import '../providers/user_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final shopUser = Provider.of<UserProvider>(context);
    final username = shopUser.user.name;
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppBar(
            title: Text('Hello $username!'),
            //  automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Store'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: () {},
          ),
          TextButton(
              onPressed: (() {
                shopUser.user.id != 'null'
                    ? Provider.of<UserProvider>(context, listen: false)
                        .logout(context)
                    : signIn(context);
              }),
              child: shopUser.user.id != 'null'
                  ? const Text('Sign Out')
                  : const Text('Sign In'))
        ],
      ),
    );
  }

  signIn(context) {
    push(context, NamedRoute.loginScreen);
  }
}

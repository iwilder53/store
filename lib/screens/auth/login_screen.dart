import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wildersmerch/navigation/navigators.dart';
import 'package:wildersmerch/navigation/routes.dart';
import 'package:wildersmerch/providers/user_provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  TextEditingController usernameConttroller = TextEditingController();
  TextEditingController passwordConttroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth * 0.1, vertical: displayWidth * 0.1),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("Wilder\'s Merch")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameConttroller,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordConttroller,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await Provider.of<UserProvider>(context, listen: false).login(
                    user: usernameConttroller.text.trim(),
                    password: passwordConttroller.text.trim());
                push(context, NamedRoute.homeScreen);
              },
              child: const Text('Sign In')),
          TextButton(
              //  style: ButtonStyle(),
              child: const Text('dont have an account ? sign up here'),
              onPressed: () {
                Navigator.of(context).pushNamed(NamedRoute.registerScreen);
              })
        ]),
      ),
    );
  }
}

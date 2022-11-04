import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wildersmerch/models/shop_user.dart';
import 'package:wildersmerch/navigation/navigators.dart';
import 'package:wildersmerch/navigation/routes.dart';

import '../../providers/user_provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password (min. 6 letters)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addressController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: numberController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addressController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Shipping Address',
                ),
              ),
            ),
            const Divider(),
            ElevatedButton(
                onPressed: () async {
                  bool success = await Provider.of<UserProvider>(context,
                          listen: false)
                      .register(
                          ShopUser(
                              number: int.parse(numberController.text.trim()),
                              address: addressController.text,
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              id: '1',
                              seller: false),
                          passwordController.text.trim());
                  if (success) {
                    // ignore: use_build_context_synchronously
                    push(context, NamedRoute.homeScreen);
                  }
                },
                child: const Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}

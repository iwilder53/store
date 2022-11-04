import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wildersmerch/navigation/navigationService.dart';
import 'package:wildersmerch/providers/user_provider.dart';
import 'package:wildersmerch/screens/homepage.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<UserProvider>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
            title: 'MyShop',
            onGenerateRoute: generateRoute,
            theme: ThemeData(
                primarySwatch: Colors.blueGrey,
                fontFamily: 'Krungthep',
                primaryTextTheme: const TextTheme(
                    displayMedium: TextStyle(
                        fontFamily: 'Krungthep', color: Colors.white70))),
            home: const HomeScreen()));
  }
}

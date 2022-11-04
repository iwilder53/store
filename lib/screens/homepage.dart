import 'package:flutter/material.dart';
import 'package:wildersmerch/widgets/app_drawer.dart';
import 'package:wildersmerch/widgets/featured.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  decoration: const BoxDecoration(color: Colors.transparent),
      child: Scaffold(
        drawer: AppDrawer(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Wilder’s Merch',
            style: TextStyle(
                fontFamily: 'Krungthep', fontSize: 24, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          centerTitle: false,
          actions: [],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Featured',
                style: TextStyle(
                    fontFamily: 'Krungthep',
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            FeaturedProducts(),
          ],
        ),
      ),
    );
  }
}

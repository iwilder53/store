import 'package:flutter/material.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(displayWidth * 0.05),
        height: displayWidth * 0.6,
        width: displayWidth * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: displayWidth * 0.4,
              width: 300,
              child: Image.network(
                  fit: BoxFit.fitHeight,
                  'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg'),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Figurine 1 something something ...',
                  style:
                      TextStyle(fontFamily: 'Krungthep', color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                Text('\$19.99')
              ],
            )
          ],
        ),
      ),
    );
  }
}

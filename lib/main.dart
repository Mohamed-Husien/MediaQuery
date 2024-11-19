import 'package:flutter/material.dart';

void main() {
  runApp(const MediaQueryTest());
}

class MediaQueryTest extends StatelessWidget {
  const MediaQueryTest({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.amberAccent,
              height: height * .2,
              width: 200,
            ),
            Container(
              color: Colors.black,
              height: height * .2,
              width: 200,
            ),
            Container(
              color: Colors.red,
              height: height * .2,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}

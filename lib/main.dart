import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutBuilderTest());
}

class LayoutBuilderTest extends StatelessWidget {
  const LayoutBuilderTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          log(constraints.maxWidth.toString());
          if (constraints.maxWidth <= 500) {
            return const MobileLayout();
          } else {
            return const Center(
              child: Text("Another platform"),
            );
          }
        }),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            color: Colors.green,
            child: ListTile(
              title: Text("${index + 1}"),
            ),
          );
        });
  }
}

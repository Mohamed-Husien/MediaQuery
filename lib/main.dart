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
            return const AnotherLayout();
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

class AnotherLayout extends StatefulWidget {
  const AnotherLayout({super.key});

  @override
  State<AnotherLayout> createState() => _AnotherLayoutState();
}

class _AnotherLayoutState extends State<AnotherLayout> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              child: Text(number.toString()),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  color: Colors.green,
                  child: ListTile(
                    onTap: () {
                      number = index + 1;
                      setState(() {});
                    },
                    title: Text("${index + 1}"),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyAplikasi());
}

class MyAplikasi extends StatelessWidget {
  const MyAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text("MyApps"),
        ),
        body: ListView(
          children: [
            Container(
              height: 150,
              color: Colors.red,
              child: const Center(child: Text("3")),
            ),
            Container(
              height: 150,
              color: Colors.yellow,
              child: const Center(child: Text("1")),
            ),
            Container(
              height: 150,
              color: Colors.pink,
              child: const Center(child: Text("2")),
            ),
            Container(
              height: 150,
              color: Colors.red,
              child: const Center(child: Text("3")),
            ),
            Container(
              height: 150,
              color: Colors.yellow,
              child: const Center(child: Text("1")),
            ),
            Container(
              height: 150,
              color: Colors.pink,
              child: const Center(child: Text("2")),
            ),
            Container(
              height: 150,
              color: Colors.grey,
              child: const Center(child: Text("3")),
            ),
          ],
        ),
      ),
    );
  }
}
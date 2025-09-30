import 'package:flutter/material.dart';
import 'package:willyan_24/app.dart';

void main() {
  runApp(const MyAplikasi());
}

class MyAplikasi extends StatelessWidget {
  const MyAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: const Text("MyApps"),
          ),
          body: Center(
              child: Image.network(
                  "https://cdn.mos.cms.futurecdn.net/4erwdeJ3zkiSB4Ba5SCSa5.jpg")),
        ));
  }
}
import 'package:flutter/material.dart';


void main() {
  runApp(MyAplikasi());
}

class MyAplikasi extends StatelessWidget {
  const MyAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text("MyApps"),
          ),
          body: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.greenAccent,
              child: Center(child: Text("Halo, saya Willy Achmad")),
            ),
          )),
    );
  }
}
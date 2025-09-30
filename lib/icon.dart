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
              child: Icon(
                Icons.home,
                size: 90.0,
                color: Colors.black45,


              ),
            )));
  }
}
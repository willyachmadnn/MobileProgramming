import 'package:flutter/material.dart';
import 'package:project_23024/p3/Makanan.dart';
import 'package:project_23024/p3/Minuman.dart';
import 'package:project_23024/p3/Cemilan.dart';
import 'p3/beranda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      initialRoute: '/beranda',
      routes: {
        '/beranda': (context) => const Beranda(),
        '/Makanan': (context) => const MakananScreen(),
        '/Minuman': (context) => const MinumanScreen(),
        '/Cemilan': (context) => const CemilanScreen(),
      },
    );
  }
}


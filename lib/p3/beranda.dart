import 'package:flutter/material.dart';
import 'package:project_23024/CustomeWidgets/MenuItemBeranda.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
        title: Text(
          "Cafe Sanya",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/Makanan");
              },
              child: MenuItemBeranda(kategori: "Makanan",
                  imagePath: "assets/makanan.jpg",),
            ),
            SizedBox(height: 22,),
            MenuItemBeranda(kategori: "Minuman",
            imagePath: "assets/minuman.png",),
            SizedBox(height: 22,),
            MenuItemBeranda(kategori: "Cemilan", imagePath: "assets/cemilan.png",),
            SizedBox(height: 22,),
          ],
        ),
      ),
    );
  }
}

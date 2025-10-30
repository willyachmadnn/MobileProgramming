import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<Map<String, dynamic>> dataList = [
    {
      "country": "Brazil",
      "id": 1,
    },
    {
      "country": "Tunisia",
      "id": 2,
    },
    {
      "country": "Canada",
      "id": 3,
    },
    {
      "country": "India",
      "id": 4,
    },
    {
      "country": "Indonesia",
      "id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DROPDOWN"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: DropdownSearch<Map<String, dynamic>>(
          items: dataList,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Pilih Negara",
              hintText: "Negara dalam daftar",
            ),
          ),
          popupProps: PopupProps.bottomSheet(
            showSearchBox: true,
            title: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Pilih Negara',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            itemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item["country"].toString()),
            ),
          ),
          onChanged: (value) => print(value),
          selectedItem: {
            "country": "Canada",
            "id": 3,
          },
          itemAsString: (item) => item["country"].toString(),
          dropdownBuilder: (context, selectedItem) => Text(selectedItem?["country"].toString() ?? "Belum pilih negara"),
        ),
      ),
    );
  }
}
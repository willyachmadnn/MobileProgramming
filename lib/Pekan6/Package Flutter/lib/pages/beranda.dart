import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/provinsi.dart';
import '../models/kota.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedProvince;
  List<dynamic> provinces = [];
  List<dynamic> cities = [];
  String? selectedCity;
  bool isLoadingProvinces = false;
  bool isLoadingCities = false;
  final String apiKey =
      "3365dcc85f29c26eb3ba85d6b62fecfc82511fc37ff6c9bb4e383198a6bac445";
  @override
  void initState() {
    super.initState();
    fetchProvinces();
  }

  Future<void> fetchProvinces() async {
    setState(() {
      isLoadingProvinces = true;
    });

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Provinces API response: ${response.body}");
        if (data['code'] == "200") {
          setState(() {
            provinces = data['value'];
            isLoadingProvinces = false;
            print("Provinces loaded: ${provinces.length}");
          });
        } else {
          setState(() {
            isLoadingProvinces = false;
          });
          print("API Error: ${data['messages']}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gagal memuat data provinsi: ${data['messages']}'),
            ),
          );
        }
      } else {
        throw Exception('Failed to load provinces: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoadingProvinces = false;
      });
      print("Exception when fetching provinces: $e");
      // Tampilkan pesan error ke user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memuat data provinsi: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> fetchCities(String provinceId) async {
    setState(() {
      isLoadingCities = true;
    });

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$provinceId',
        ),
      );

      print("Cities API response: ${response.body}");
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['code'] == "200") {
          setState(() {
            cities = data['value'];
            selectedCity = null;
            isLoadingCities = false;
            print("Cities loaded: ${cities.length}");
          });
        } else {
          setState(() {
            isLoadingCities = false;
          });
          print("API Error: ${data['messages']}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Gagal memuat data kabupaten/kota: ${data['messages']}',
              ),
            ),
          );
        }
      } else {
        throw Exception('Failed to load cities: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoadingCities = false;
      });
      print("Exception when fetching cities: $e");

      // Tampilkan pesan error ke user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memuat data kota/kabupaten: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WILAYAH INDONESIA"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isLoadingProvinces
                ? Center(child: CircularProgressIndicator())
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Provinsi",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                      ),
                      value: selectedProvince,
                      hint: Text("Pilih Provinsi"),
                      items: provinces.isEmpty
                          ? []
                          : provinces.map<DropdownMenuItem<String>>((province) {
                              return DropdownMenuItem<String>(
                                value: province["id"],
                                child: Text(province["name"]),
                              );
                            }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedProvince = value;
                            cities = [];
                          });
                          fetchCities(value);
                        }
                      },
                      isExpanded: true,
                      menuMaxHeight: 300,
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      itemHeight: 50,
                    ),
                  ),
            SizedBox(height: 16),
            isLoadingCities
                ? Center(child: CircularProgressIndicator())
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Kota/Kabupaten",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                      ),
                      value: selectedCity,
                      hint: Text("Pilih Kota/Kabupaten"),
                      items: cities.isEmpty
                          ? []
                          : cities.map<DropdownMenuItem<String>>((city) {
                              return DropdownMenuItem<String>(
                                value: city["id"],
                                child: Text(city["name"]),
                              );
                            }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedCity = value;
                          });
                        }
                      },
                      isExpanded: true,
                      menuMaxHeight: 300,
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      itemHeight: 50,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

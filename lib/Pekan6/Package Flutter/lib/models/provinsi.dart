import 'dart:convert';

List<Province> provincesFromJson(String str) {
  final Map<String, dynamic> data = json.decode(str);
  if (data['value'] != null) {
    return List<Province>.from(data['value'].map((x) => Province.fromJson(x)));
  }
  return [];
}

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  Province({required this.id, required this.name});

  String id;
  String name;

  factory Province.fromJson(Map<String, dynamic> json) =>
      Province(id: json["id"] ?? "", name: json["name"] ?? "");

  Map<String, dynamic> toJson() => {"id": id, "name": name};

  @override
  String toString() => name;
}

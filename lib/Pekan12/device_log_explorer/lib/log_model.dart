import 'dart:convert';

class LogEntry {
  final String id;
  final String timestamp;
  final double latitude;
  final double longitude;
  final String imagePath;

  LogEntry({
    required this.id,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
    required this.imagePath,
  });

  factory LogEntry.fromJson(Map<String, dynamic> json) {
    return LogEntry(
      id: json['id'] as String,
      timestamp: json['timestamp'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      imagePath: json['imagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp,
      'latitude': latitude,
      'longitude': longitude,
      'imagePath': imagePath,
    };
  }
}
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Features Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ImagePickerDemo(),
    const FileSystemDemo(),
    const LocationDemo(),
    const SensorDemo(),
    const NativeCallDemo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Files'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.sensors), label: 'Sensors'),
          BottomNavigationBarItem(icon: Icon(Icons.android), label: 'Native'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kamera & Galeri')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_imageFile != null)
              Image.file(
                File(_imageFile!.path),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
            else
              const Icon(Icons.image, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Galeri'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Kamera'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FileSystemDemo extends StatefulWidget {
  const FileSystemDemo({super.key});

  @override
  State<FileSystemDemo> createState() => _FileSystemDemoState();
}

class _FileSystemDemoState extends State<FileSystemDemo> {
  String _fileContent = 'Belum ada data';
  final String _fileName = 'my_data.txt';
  final TextEditingController _controller = TextEditingController();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<File> _writeToFile(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  Future<String> _readFromFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'Gagal membaca: $e';
    }
  }

  void _saveAndLoadData() async {
    if (_controller.text.isNotEmpty) {
      await _writeToFile(_controller.text);
      final loadedContent = await _readFromFile();
      setState(() {
        _fileContent = loadedContent;
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File System')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan text untuk disimpan',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveAndLoadData,
              child: const Text('Simpan & Baca'),
            ),
            const SizedBox(height: 20),
            const Text('Isi File Terakhir:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(_fileContent),
          ],
        ),
      ),
    );
  }
}

class LocationDemo extends StatefulWidget {
  const LocationDemo({super.key});

  @override
  State<LocationDemo> createState() => _LocationDemoState();
}

class _LocationDemoState extends State<LocationDemo> {
  String _currentLocation = 'Tekan tombol untuk cek lokasi';
  bool _isLoading = false;

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentLocation = 'Layanan lokasi mati.';
        _isLoading = false;
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = 'Izin lokasi ditolak.';
          _isLoading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = 'Izin lokasi ditolak permanen.';
        _isLoading = false;
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentLocation = 'Lat: ${position.latitude}\nLon: ${position.longitude}';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lokasi GPS')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.map, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Text(_currentLocation, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: const Text('Cek Lokasi'),
            ),
          ],
        ),
      ),
    );
  }
}

class SensorDemo extends StatefulWidget {
  const SensorDemo({super.key});

  @override
  State<SensorDemo> createState() => _SensorDemoState();
}

class _SensorDemoState extends State<SensorDemo> {
  double _x = 0.0, _y = 0.0, _z = 0.0;
  StreamSubscription<AccelerometerEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = accelerometerEventStream().listen(
          (AccelerometerEvent event) {
        if (mounted) {
          setState(() {
            _x = event.x;
            _y = event.y;
            _z = event.z;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensor Accelerometer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Gerakkan HP Anda', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('X: ${_x.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24)),
            Text('Y: ${_y.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24)),
            Text('Z: ${_z.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

class NativeCallDemo extends StatefulWidget {
  const NativeCallDemo({super.key});

  @override
  State<NativeCallDemo> createState() => _NativeCallDemoState();
}

class _NativeCallDemoState extends State<NativeCallDemo> {
  static const platform = MethodChannel('com.yourapp/device_info');
  String _osVersion = 'Belum ada data';

  Future<void> _getOsVersion() async {
    String osVersion;
    try {
      final String result = await platform.invokeMethod('getOsVersion');
      osVersion = result;
    } on PlatformException catch (e) {
      osVersion = "Gagal: '${e.message}'.";
    }

    setState(() {
      _osVersion = osVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Method Channel (Native)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
                Icons.settings_system_daydream, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            Text('OS Version: $_osVersion',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getOsVersion,
              child: const Text('Ambil Versi OS dari Native'),
            ),
          ],
        ),
      ),
    );
  }
}

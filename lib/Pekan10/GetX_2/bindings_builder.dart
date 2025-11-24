import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FormController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;

  void updateName(String newName) {
    name.value = newName;
  }
  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  bool validateForm() {
    return name.isNotEmpty && email.isNotEmpty;
  }
}


class FormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FormController());
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Bindings Form Example',
      initialRoute: '/Form',
      getPages: [
        GetPage(name: '/Form',
          page: () => FormPage(),
          binding: FormBinding(),
        ),
      ],
    );
  }
}


class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FormController>();
    return Scaffold(
      appBar: AppBar(title: Text("Form Pengguna dengan GetX")),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Nama', controller.updateName),
            _buildTextField('Email', controller.updateEmail),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                controller.validateForm()
                    ?Get.snackbar('Sukses', "Formulir Berhasil dikirim")
                    : Get.snackbar('Gagal', "Nama dan Email harus diisi!!");
              },
              child: Text("Kirim"),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTextField(String label, Function(String) onChanged) {
    return Padding(padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
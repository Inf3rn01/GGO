import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ggo/features/authentication/controlers/sign_up/signup_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class TermsConditionsCheckbox extends StatefulWidget {
  const TermsConditionsCheckbox({super.key});

  @override
  _TermsConditionsCheckboxState createState() => _TermsConditionsCheckboxState();
}

class _TermsConditionsCheckboxState extends State<TermsConditionsCheckbox> {
  Future<Directory> _getDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  Future<void> _downloadAndOpenFile(String assetPath, String filename) async {
    final directory = await _getDirectory();
    final filePath = '${directory.path}/$filename';
    final file = File(filePath);

    // Загружаем файл из assets
    final byteData = await rootBundle.load(assetPath);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    // Убеждаемся, что файл существует перед открытием
    if (await file.exists()) {
      // Открываем файл на всех платформах с помощью OpenFile.open
      OpenFile.open(filePath);
    } else {
      if (kDebugMode) {
        print('File does not exist: $filePath');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(height: 20, width: 25,
                child: Obx(()=> Checkbox(
                  value: controller.hideCheckbox.value,
                  onChanged: (value) => controller.hideCheckbox.value = !controller.hideCheckbox.value)
                ),
              ),
              const Text('I agree to', style: TextStyle(fontSize: 14)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _downloadAndOpenFile('assets/download_files/Privacy Policy.pdf', 'Privacy Policy.pdf');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 14.5, decoration: TextDecoration.underline, decorationColor: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              const Text('and', style: TextStyle(fontSize: 14)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _downloadAndOpenFile('assets/download_files/Terms of use.pdf', 'Terms of use.pdf');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text(
                      'Terms of use',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 14.5, decoration: TextDecoration.underline, decorationColor: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
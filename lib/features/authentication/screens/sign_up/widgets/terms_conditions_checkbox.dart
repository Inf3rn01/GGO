import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      print('File does not exist: $filePath');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              const Text('I agree to', style: TextStyle(fontSize: 13)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _downloadAndOpenFile('assets/download_files/Privacy Policy.pdf', 'Privacy Policy.pdf');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 13.5, decoration: TextDecoration.underline, decorationColor: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              const Text('and', style: TextStyle(fontSize: 13)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _downloadAndOpenFile('assets/download_files/Terms of use.pdf', 'Terms of use.pdf');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: const Text(
                      'Terms of use',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 13.5, decoration: TextDecoration.underline, decorationColor: Colors.blue),
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
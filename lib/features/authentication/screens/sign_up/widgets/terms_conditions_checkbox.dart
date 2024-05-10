import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_look/quick_look.dart';
import 'package:url_launcher/url_launcher.dart';

class GTermsAndConditions extends StatefulWidget {
  const GTermsAndConditions({super.key});

  @override
  _GTermsAndConditionsState createState() => _GTermsAndConditionsState();
}

class _GTermsAndConditionsState extends State<GTermsAndConditions> {
  Future<Directory?> getPlatformDirectory() async {
    if (kIsWeb) {
      // Для веб-версии используем директорию документов
      return await getApplicationDocumentsDirectory();
    } else {
      // Для других платформ используем директорию загрузок
      try {
        return await getDownloadsDirectory();
      } catch (_) {
        // Если директория загрузок недоступна, используем директорию документов
        return await getApplicationDocumentsDirectory();
      }
    }
  }

  Future<void> _downloadFile(String assetPath, String filename) async {
  final directory = await getPlatformDirectory();
  if (directory == null) {
    throw 'Не удалось определить директорию для загрузки файлов';
  }
  final filePath = '${directory.path}/$filename';
  final file = File(filePath);

  // Загружаем файл из assets
  final byteData = await rootBundle.load(assetPath);
  await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  // Открываем файл в соответствии с платформой
  if (kIsWeb) {
    // Для веб-версии создаем ссылку на base64-код
    final base64Data = base64Encode(byteData.buffer.asUint8List());
    final dataUrl = 'data:application/pdf;base64,$base64Data';

    // Проверяем, можем ли мы открыть URL
    if (await canLaunchUrl(Uri.parse(dataUrl))) {
      await launchUrl(Uri.parse(dataUrl));
    } else {
      throw 'Невозможно открыть URL: $dataUrl';
    }
  } else if (Platform.isWindows) {
    // Для Windows открываем файл с помощью системного PDF просмотрщика
    await Process.run('explorer', [filePath]);
  } else if (Platform.isAndroid) {
    // Для Android используем OpenFile.open
    OpenFile.open(filePath);
  // } else if (Platform.isIOS) {
  //   // Для iOS используем QuickLook.openFile
  //   QuickLook.openFile(filePath);
  // }
  }
}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(height: 21, width: 21, child: Checkbox(value: true, onChanged: (value) {})),
            const SizedBox(width: 7),
            const Text('I agree to', style: TextStyle(fontSize: 14)),
            GestureDetector(
              onTap: () {
                _downloadFile('assets/download_files/Privacy Policy.pdf', 'Privacy Policy.pdf');
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                child: const Text('Privacy Policy', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 13.8, decoration: TextDecoration.underline, decorationColor: Colors.blue)),
              ),
            ),
            const Text('and', style: TextStyle(fontSize: 14)),
            GestureDetector(
              onTap: () {
                _downloadFile('assets/download_files/Terms of use.pdf', 'Terms of use.pdf');
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                child: const Text('Terms of use', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 13.8, decoration: TextDecoration.underline, decorationColor: Colors.blue)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
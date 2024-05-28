import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/utils/constants/colors.dart';

class GetGunScreen extends StatelessWidget {
  const GetGunScreen({super.key});

  Future<String> loadTextFile() async {
    return await rootBundle.loadString('assets/download_files/how_get_a_gun.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(showBackArrow: true, title: Text('How can I get a gun?')),
      body: FutureBuilder<String>(
        future: loadTextFile(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  GRoundedContainer(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: GColors.dark,
                    child: Text(
                      snapshot.data ?? '',
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
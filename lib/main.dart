import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ggo/app.dart';
import 'package:ggo/firebase_options.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'utils/constants/api_constants.dart';

Future<void> main() async {

  //final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(AuthenticationRepository());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Stripe.publishableKey = APIConstants.publicAPIkey;

  runApp(const App());
}
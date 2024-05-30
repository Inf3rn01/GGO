import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> resultList) {
  final ConnectivityResult result = resultList.last;
  _connectionStatus.value = result;
  if (result == ConnectivityResult.none) {
    Loaders.errorSnackBar(title: 'No Internet Connection', message: 'Please check your internet connection and try again.');
  } else {
    Loaders.successSnackBar(title: 'Alright, you have ethernet connection!');
  }
}

  Future<bool> isConnected() async {
  try {
    final result = await _connectivity.checkConnectivity();
    
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  } on PlatformException catch (e) {
    // Обработка ошибки платформы
    if (kDebugMode) {
      print('PlatformException: ${e.message}');
    }
    return false;
  } catch (e) {
    // Обработка других ошибок
    if (kDebugMode) {
      print('Exception: ${e.toString()}');
    }
    return false;
  }
}

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
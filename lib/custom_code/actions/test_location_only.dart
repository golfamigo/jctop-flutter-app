// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// 測試一號：只獲取座標，回傳字串
import 'package:geolocator/geolocator.dart';
import 'dart:async';

Future<String> testLocationOnly() async {
  print('--- [Test 1] Location Test Started ---');
  try {
    // 檢查服務是否啟用
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('[Test 1] FAILED: Location service is disabled.');
      return 'FAIL: Location service disabled.';
    }

    // 檢查與請求權限
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('[Test 1] FAILED: Permissions were denied.');
      return 'FAIL: Permissions denied.';
    }

    print('[Test 1] Permissions OK. Getting position...');
    // 獲取位置，設定15秒超時
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .timeout(const Duration(seconds: 15));

    print('[Test 1] SUCCESS! Got position.');
    return 'SUCCESS: Lat=${position.latitude}, Lng=${position.longitude}';
  } catch (e) {
    print('[Test 1] FAILED with critical error: $e');
    return 'CRITICAL FAIL: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

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

// 在 Custom Actions 中貼上此程式碼
// 記得將 Action 的回傳類型 (Return Type) 設定為 String
// 在 Custom Actions 中貼上此程式碼
// Action 的回傳類型 (Return Type) 應設定為 String
// 偵錯增強版：捕捉所有錯誤並提供詳細日誌
import 'package:geolocator/geolocator.dart';
import 'dart:async'; // 為了處理 TimeoutException
import 'package:geocoding/geocoding.dart';

Future<String> getCityNameOrCoordsDebug() async {
  // 用一個大的 try-catch 包住所有邏輯，防止任何未捕獲的錯誤導致 null
  try {
    print('✅ Action started: getCityNameOrCoordsDebug');
    bool serviceEnabled;
    LocationPermission permission;
    Position? position;

    // --- 1. 檢查權限與獲取座標 ---
    print('▶️ Step 1: Checking permissions and getting location...');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('❌ Error condition: Location service is disabled.');
      return 'Error: Location service is disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print('ℹ️ Info: Permission denied, requesting now...');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('❌ Error condition: Location permissions were denied.');
        return 'Error: Location permissions were denied.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('❌ Error condition: Location permissions are permanently denied.');
      return 'Error: Location permissions are permanently denied.';
    }

    print('✅ Permissions granted. Getting current position...');
    // NEW CODE
    try {
      // 增加超時設定，例如 10 秒
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(const Duration(seconds: 10));
      print(
          '✅ Position received: Lat=${position.latitude}, Long=${position.longitude}');
    } catch (e) {
      // 捕捉所有錯誤，包括超時，並回傳超時訊息
      print(
          '❌ Error condition: Getting location timed out or failed. Error: $e');
      return 'Error: Location request timed out.';
    }

    if (position == null) {
      print(
          '❌ Error condition: Failed to retrieve position for unknown reason.');
      return 'Error: Failed to retrieve position.';
    }

    // --- 2. 進行反向地理編碼 ---
    print('▶️ Step 2: Starting reverse geocoding...');
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    print('✅ Geocoding API call finished.');

    if (placemarks.isNotEmpty) {
      String? city = placemarks[0].locality;
      if (city != null && city.isNotEmpty) {
        print('✅ Success: Found city -> $city');
        return city;
      }
    }

    print(
        'ℹ️ Info: Geocoding succeeded but no city name found. Returning coordinates.');
    return 'Geocoding failed for lat: ${position.latitude}, long: ${position.longitude}';
  } catch (e) {
    // 這是最終的防護網，捕捉所有意料之外的錯誤
    print('🔥🔥🔥 CRITICAL UNCAUGHT ERROR: $e');
    return 'CRITICAL ACTION ERROR: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

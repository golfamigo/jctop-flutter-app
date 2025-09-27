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
import 'package:geolocator/geolocator.dart';

Future<LatLng> getCurrentLocationReliably() async {
  bool serviceEnabled;
  LocationPermission permission;

  // 1. 檢查裝置的定位服務是否已開啟
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // 定位服務未開啟，回傳一個預設值或拋出錯誤
    // 為了避免 App 崩潰，這裡回傳一個無效但安全的 LatLng
    return Future.error('Location services are disabled.');
  }

  // 2. 檢查 App 的位置權限狀態
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // 如果權限被拒絕，則向使用者發出請求
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // 如果使用者再次拒絕，則回傳錯誤
      return Future.error('Location permissions are denied');
    }
  }

  // 3. 檢查權限是否被永久拒絕
  if (permission == LocationPermission.deniedForever) {
    // 如果權限被永久拒絕，則無法請求權限
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // 4. 當權限都通過後，獲取目前位置
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high, // 可設定精確度
  );

  // 5. 將 geolocator 的 Position 物件轉換為 FlutterFlow 的 LatLng 物件並回傳
  return LatLng(position.latitude, position.longitude);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

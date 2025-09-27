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

// 測試二號：只轉換寫死的座標
import 'package:geocoding/geocoding.dart';

Future<String> testGeocodingOnly() async {
  print('--- [Test 2] Geocoding Test Started ---');
  try {
    // 使用台北101的固定座標
    double lat = 25.033964;
    double lng = 121.564468;
    print('[Test 2] Using hardcoded coords: Lat=$lat, Lng=$lng');

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    if (placemarks.isNotEmpty) {
      String? city = placemarks[0].locality;
      if (city != null && city.isNotEmpty) {
        print('[Test 2] SUCCESS! Found city: $city');
        return 'SUCCESS: City is $city';
      } else {
        print('[Test 2] FAILED: API call worked but no city name found.');
        return 'FAIL: Geocoding found no city.';
      }
    } else {
      print('[Test 2] FAILED: API call returned no placemarks.');
      return 'FAIL: Geocoding returned nothing.';
    }
  } catch (e) {
    print('[Test 2] FAILED with critical error: $e');
    return 'CRITICAL FAIL: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

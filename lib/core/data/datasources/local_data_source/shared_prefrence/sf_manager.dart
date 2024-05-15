import 'dart:convert';
import 'package:InvoiceF/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SfManager {
   Future<void> saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
   Future<String?> getString(String key) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getString(key);
   }

   Future<void> saveInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
   Future<int?> getInt(String key) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getInt(key);
   }


   Future<void> saveObject<T>(String key, T object) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(object);
    await prefs.setString(key, jsonString);
  }

   Future<T?> getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }
   Future<void> saveBool(String key, bool value) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setBool(key, value);
   }

   Future<bool> getBool(String key) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     bool? value = prefs.getBool(key);
     return value ?? true;
   }


}

import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService  {
  // A static reference to the SharedPreferences instance
  static late SharedPreferences sharedpref;

  // Initializes the SharedPreferences instance
  static Future<void> sharedPrefInit() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  // Saves a value to SharedPreferences based on its type (String, double, int, or bool)
  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      await sharedpref.setString(key, value);
      return true;
    }
    if (value is double) {
      await sharedpref.setDouble(key, value);
      return true;
    }
    if (value is int) {
      await sharedpref.setInt(key, value);
      return true;
    }
    if (value is bool) {
      await sharedpref.setBool(key, value);
      return true;
    }
    return false; // Returns false if the type is not supported
  }

  // Retrieves a value from SharedPreferences without knowing its type
  static dynamic getData({required String key}) {
    return sharedpref.get(key);
  }

  // Deletes a value from SharedPreferences using its key
  static void deleteData({required String key}) async {
    await sharedpref.remove(key);
  }

  // Clears all data from SharedPreferences if the clearData flag is true
  static Future<bool> clearData({required bool clearData}) async {
    if (clearData == true) {
      await sharedpref.clear();
    }
    return false; // Returns false if clearData is not true
  }

  // Saves a Map as a JSON string in SharedPreferences
  static Future<bool> setMapData(
      {required String key, required Map value}) async {
    String jsonString = jsonEncode(value); // Converts the map to a JSON string
    return await sharedpref.setString(key, jsonString);
  }

  // Retrieves a Map from SharedPreferences that was stored as a JSON string
  static Map<String, dynamic> getMapData({required String key}) {
    String jsonString = sharedpref.getString(key) ??
        '{}'; // Retrieves the JSON string or an empty JSON object
    return jsonDecode(jsonString); // Decodes the JSON string back into a Map
  }

  // Saves a list of maps as a JSON string in SharedPreferences
  static Future<bool> setListOfMaps(
      {required String key, required List<Map<String, dynamic>> value}) async {
    String jsonString =
        jsonEncode(value); // Converts the list of maps to a JSON string
    return await sharedpref.setString(key, jsonString);
  }

  // Retrieves a list of maps from SharedPreferences that was stored as a JSON string
  static List<Map<String, dynamic>> getListOfMaps({required String key}) {
    String jsonString = sharedpref.getString(key) ??
        '[]'; // Retrieves the JSON string or an empty JSON array
    List<dynamic> jsonList =
        jsonDecode(jsonString); // Decodes the JSON string back into a List
    return jsonList
        .map((e) => e as Map<String, dynamic>)
        .toList(); // Converts each element back into a Map
  }

  // Sets the current date and time as a formatted string in SharedPreferences
  static Future<void> setLastUpdatedTime(String key) async {
    DateTime now = DateTime.now(); // Gets the current date and time
    DateFormat formatter =
        DateFormat('yyyy-MM-dd hh:mm a'); // Defines the date format
    String formattedDate =
        formatter.format(now); // Formats the current date and time
    await sharedpref.setString(key, formattedDate);
  }

  // Retrieves the last updated time string from SharedPreferences
  static String? getLastUpdatedTime(String key) {
    return sharedpref.getString(key);
  }
}

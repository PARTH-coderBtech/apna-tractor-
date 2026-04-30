import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart'; // <--- Import check karein
import 'dart:convert';

class FavService {
  static const String _key = 'favourite_tractors';

  // Toggle Favourite Logic
  static Future<void> toggleFavourite(Map<String, String> tractor) async {
    try {
      final prefs = await SharedPreferences.getInstance(); // Yahan error nahi aana chahiye ab
      List<String> favList = prefs.getStringList(_key) ?? [];
      
      int index = favList.indexWhere((item) {
        final decoded = json.decode(item);
        return decoded['name'] == tractor['name'];
      });

      if (index >= 0) {
        favList.removeAt(index);
      } else {
        favList.add(json.encode(tractor));
      }
      await prefs.setStringList(_key, favList);
    } catch (e) {
      debugPrint("Error toggling favourite: $e");
    }
  }

  // Get All Favourites
  static Future<List<Map<String, String>>> getFavourites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> favList = prefs.getStringList(_key) ?? [];
      return favList.map((item) => Map<String, String>.from(json.decode(item))).toList();
    } catch (e) {
      return [];
    }
  }
}
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MockDataService extends GetxService {
  Future<Map<String, dynamic>> loadJson(String fileName) async {
    try {
      final String response = await rootBundle.loadString('assets/mock_data/$fileName');
      return json.decode(response);
    } catch (e) {
      print('Error loading mock data: $e');
      return {};
    }
  }

  Future<List<dynamic>> loadList(String fileName, String key) async {
    final data = await loadJson(fileName);
    return data[key] ?? [];
  }
}

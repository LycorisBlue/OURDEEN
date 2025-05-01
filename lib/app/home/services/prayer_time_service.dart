// services/prayer_api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:our_deen/data/models/prayer_times.dart';

class PrayerApiService {
  static const String baseUrl = 'http://api.aladhan.com/v1';

  static Future<PrayerTimes> getPrayerTimes({
    required double latitude,
    required double longitude,
    required int method,
    String date = '',
  }) async {
    final now = DateTime.now();
    final dateStr = date.isEmpty 
      ? '${now.day}-${now.month}-${now.year}'
      : date;
    
    final url = Uri.parse(
      '$baseUrl/timings/$dateStr?latitude=$latitude&longitude=$longitude&method=$method'
    );
    
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)['data'];
      return PrayerTimes.fromJson(data);
    } else {
      throw Exception('Échec de chargement des temps de prière');
    }
  }
}
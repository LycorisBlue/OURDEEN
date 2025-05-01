// models/prayer_times.dart
class PrayerTimes {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String date;

  PrayerTimes({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.date,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    final timings = json['timings'];
    return PrayerTimes(
      fajr: _formatTime(timings['Fajr']),
      dhuhr: _formatTime(timings['Dhuhr']),
      asr: _formatTime(timings['Asr']),
      maghrib: _formatTime(timings['Maghrib']),
      isha: _formatTime(timings['Isha']),
      date: json['date']['readable'],
    );
  }

  static String _formatTime(String time) {
    // Extraire les heures et minutes de la chaîne qui contient souvent des infos additionnelles
    final parts = time.split(' ')[0].split(':');
    return '${parts[0]}:${parts[1]}';
  }
}
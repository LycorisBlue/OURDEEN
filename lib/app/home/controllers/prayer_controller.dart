
import '/constants/app_export.dart';
import 'package:intl/intl.dart';

class PrayerTimeController extends GetxController {
  final RxString nextPrayer = "Maghrib".obs;
  final RxString nextPrayerTime = "22:01".obs;
  final RxInt minutesRemaining = 1.obs;
  final RxString hijriDate = "29 dhou al qi'da 1443 AH".obs;
  // Temps actuel
  final Rx<DateTime> currentTime = DateTime.now().obs;
  
  // Les temps de prière pour Abidjan
  final Map<String, String> prayerTimes = {
    "Fajr": "04:00",
    "Shoroq": "05:55",
    "Dhuhr": "13:55",
    "Asr": "16:30",
    "Maghrib": "22:01",
    "Isha": "20:30",
  };
  
  @override
  void onInit() {
    super.onInit();
    updateCurrentTime();
  }

  void updateCurrentTime() {
    currentTime.value = DateTime.now();
  }
  
  String getCurrentTimeFormatted() {
    return DateFormat('HH:mm').format(currentTime.value);
  }
}
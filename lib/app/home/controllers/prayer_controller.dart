import 'dart:async';

import 'package:hijri/hijri_calendar.dart';

import '/app/home/services/prayer_time_service.dart';
import '/data/models/prayer_times.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

import '/constants/app_export.dart';

class PrayerTimeController extends GetxController {
  // final RxString nextPrayer = "Maghrib".obs;
  // final RxString nextPrayerTime = "22:01".obs;
  final RxString hijriDate =
      HijriCalendar.now().toFormat("dd MMMM yyyy AH").obs;
  // Temps actuel
  final Rx<DateTime> currentTime = DateTime.now().obs;
  // Les temps de prière pour Abidjan
  // final Map<String, String> prayerTimes = {
  //   "Fajr": "04:00",
  //   "Shoroq": "05:55",
  //   "Dhuhr": "13:55",
  //   "Asr": "16:30",
  //   "Maghrib": "22:01",
  //   "Isha": "20:30",
  // };

  final storage = GetStorage();

  var isLoading = true.obs;
  var prayerTimes = Rx<PrayerTimes?>(null);
  var nextPrayer = ''.obs;
  var nextPrayerTime = ''.obs;
  var remainingTime = ''.obs;
  var currentLocation = ''.obs;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var calculationMethod = 2.obs; // Par défaut: ISNA

  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    // updateCurrentTime();
     _startTimerListener();
    _loadSavedSettings();
    _getCurrentLocation();
    _startTimer();
  }

  void _loadSavedSettings() {
    print("loading saved settings");
    latitude.value = storage.read('latitude') ?? 0.0;
    longitude.value = storage.read('longitude') ?? 0.0;
    calculationMethod.value = storage.read('method') ?? 2;
    currentLocation.value =
        storage.read('locationName') ?? 'Localisation actuelle';

    if (latitude.value != 0.0 && longitude.value != 0.0) {
      fetchPrayerTimes();
    }
  }

  void _saveSettings() {
    print("saving settings");
    storage.write('latitude', latitude.value);
    storage.write('longitude', longitude.value);
    storage.write('method', calculationMethod.value);
    storage.write('locationName', currentLocation.value);
  }

  Future<void> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      if (await Permission.location.request().isDenied) {
        Get.snackbar('Erreur', 'Permission de localisation refusée');
        isLoading.value = false;
        return;
      }
    }

    if (status.isPermanentlyDenied) {
      Get.snackbar('Erreur',
          'Permission refusée pour toujours, allez dans les paramètres.');
      isLoading.value = false;
      return;
    }

    print("Permission de localisation accordée ✅");
  }

  Future<void> _getCurrentLocation() async {
    try {
      print("getting current location");
      isLoading.value = true;

      // Si l'utilisateur a déjà une position enregistrée
      if (latitude.value != 0.0 && longitude.value != 0.0) {
        print("=========================1");
        fetchPrayerTimes();
        return;
      }

      // Vérifier les permissions
      //  LocationPermission permission = await Geolocator.checkPermission();
      // print("=========================2");
      // if (permission == LocationPermission.denied) {
      //   permission = await Geolocator.requestPermission();
      //   if (permission == LocationPermission.denied) {
      //     Get.snackbar('Erreur', 'Permission de localisation refusée');
      //     isLoading.value = false;
      //     return;
      //   }
      // }
      checkLocationPermission();

      Position position = await Geolocator.getCurrentPosition();
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      print("=========================3");
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print("=========================4");
      if (placemarks.isNotEmpty) {
        print("=========================5");
        currentLocation.value =
            placemarks[0].locality ?? 'Localisation actuelle';
      }
      print("========================6");
      print("current location: $currentLocation");
      _saveSettings();
      fetchPrayerTimes();
      print("=========================7");
    } catch (e) {
      Get.snackbar('Erreur', 'Impossible d\'obtenir la localisation: $e');
      isLoading.value = false;
    }
  }

  Future<void> fetchPrayerTimes() async {
    print("=========================11");
    try {
      print(
          " latitude: ${latitude.value}, longitude: ${longitude.value}, method: ${calculationMethod.value}");
      // isLoading.value = true;

      final times = await PrayerApiService.getPrayerTimes(
        latitude: latitude.value,
        longitude: longitude.value,
        method: calculationMethod.value,
      );

      prayerTimes.value = times;
      _calculateNextPrayer();
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Erreur', 'Impossible de charger les horaires: $e');
      isLoading.value = false;
    }
  }

  void _calculateNextPrayer() {
    print("=========================22");
    if (prayerTimes.value == null) return;

    final now = DateTime.now();
    final times = prayerTimes.value!;

    final prayers = [
      {'name': 'Fajr', 'time': _parseTime(times.fajr)},
      {'name': 'Dhuhr', 'time': _parseTime(times.dhuhr)},
      {'name': 'Asr', 'time': _parseTime(times.asr)},
      {'name': 'Maghrib', 'time': _parseTime(times.maghrib)},
      {'name': 'Isha', 'time': _parseTime(times.isha)},
    ];

    prayers.sort(
        (a, b) => (a['time'] as DateTime).compareTo(b['time'] as DateTime));

    // Trouver la prochaine prière
    DateTime? nextTime;
    String? nextName;

    for (var prayer in prayers) {
      final prayerTime = prayer['time'] as DateTime;
      if (prayerTime.isAfter(now)) {
        nextTime = prayerTime;
        nextName = prayer['name'] as String;
        break;
      }
    }

    // Si aucune prière n'est prévue aujourd'hui, la prochaine est la première de demain
    if (nextTime == null) {
      nextTime = _parseTime(times.fajr).add(Duration(days: 1));
      nextName = 'Fajr';
    }

    // Mettre à jour les valeurs observables
    nextPrayer.value = _getPrayerName(nextName!);
    nextPrayerTime.value = _formatTimeDisplay(nextTime);
    _updateRemainingTime(nextTime);
  }

  DateTime _parseTime(String timeStr) {
    final now = DateTime.now();
    final parts = timeStr.split(':');
    return DateTime(
        now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
  }

  String _formatTimeDisplay(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void _updateRemainingTime(DateTime nextPrayerTime) {
    final now = DateTime.now();
    final difference = nextPrayerTime.difference(now);

    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;

    if (hours > 0) {
      remainingTime.value =
          'DANS $hours HEURE${hours > 1 ? 'S' : ''} $minutes MINUTE${minutes > 1 ? 'S' : ''}';
    } else {
      remainingTime.value = 'DANS $minutes MINUTE${minutes > 1 ? 'S' : ''}';
    }
  }

  String _getPrayerName(String englishName) {
    switch (englishName) {
      case 'Fajr':
        return 'Fajr';
      case 'Dhuhr':
        return 'Dhuhr';
      case 'Asr':
        return 'Asr';
      case 'Maghrib':
        return 'Maghrib';
      case 'Isha':
        return 'Isha';
      default:
        return englishName;
    }
  }

  void _startTimer() {
    print("start timer");
    Future.delayed(Duration(minutes: 1), () {
      if (prayerTimes.value != null) {
        _calculateNextPrayer();
      }
      _startTimer();
    });
  }

  void _startTimerListener() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      currentTime.value = DateTime.now();
    });
  }

  void updateLocation(double lat, double lng, String locationName) {
    latitude.value = lat;
    longitude.value = lng;
    currentLocation.value = locationName;
    _saveSettings();
    fetchPrayerTimes();
  }

  void updateCalculationMethod(int method) {
    calculationMethod.value = method;
    _saveSettings();
    fetchPrayerTimes();
  }

  // void updateCurrentTime() {
  //   currentTime.value = DateTime.now();
  // }

  // String getCurrentTimeFormatted() {
  //   return DateFormat('HH:mm').format(currentTime.value);
  // }

  // Fonction pour parser "HH:mm" en DateTime aujourd'hui
  DateTime parseTime(String timeStr) {
    final now = DateTime.now();
    final parts = timeStr.split(':');
    return DateTime(
        now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
  }

  String getCurrentPrayer(Map<String, String> times) {
    DateTime now = DateTime.now();

    DateTime fajr = parseTime(times['fajr']!);
    DateTime shoroq = parseTime(
        Utils.addTimeToString(times['fajr']!, hoursToAdd: 1, minutesToAdd: 35));
    DateTime dhuhr = parseTime(times['dhuhr']!);
    DateTime asr = parseTime(times['asr']!);
    DateTime maghrib = parseTime(times['maghrib']!);
    DateTime isha = parseTime(times['isha']!);

    if (now.isAfter(fajr) && now.isBefore(shoroq)) return "Fajr";
    if (now.isAfter(shoroq) && now.isBefore(dhuhr)) return "Shoroq";
    if (now.isAfter(dhuhr) && now.isBefore(asr)) return "Dhuhr";
    if (now.isAfter(asr) && now.isBefore(maghrib)) return "Asr";
    if (now.isAfter(maghrib) && now.isBefore(isha)) return "Maghrib";
    if (now.isAfter(isha) || now.isBefore(fajr)) {
      return "Isha"; // Attention: Isha jusqu'au Fajr suivant
    }

    return ""; // Par défaut
  }

  Map<String, dynamic> getNextPrayer(Map<String, String> times) {
    final now = DateTime.now();

    final prayers = {
      "Fajr": parseTime(times['fajr']!),
      "Dhuhr": parseTime(times['dhuhr']!),
      "Asr": parseTime(times['asr']!),
      "Maghreb": parseTime(times['maghrib']!),
      "Isha": parseTime(times['isha']!),
    };

    // Trier les prières par heure croissante
    var sortedPrayers = prayers.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    // Trouver la prochaine prière
    for (var prayer in sortedPrayers) {
      if (prayer.value.isAfter(now)) {
        final duration = prayer.value.difference(now);
        return {
          'name': prayer.key,
          'duration': duration,
        };
      }
    }

    // Si aucune n'est après maintenant => prochaine prière = Fajr demain
    final tomorrowFajr = parseTime(times['fajr']!).add(Duration(days: 1));
    final duration = tomorrowFajr.difference(now);
    return {
      'name': "Fajr",
      'duration': duration,
    };
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}

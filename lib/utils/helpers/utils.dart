import 'dart:convert';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '/data/locals/data_local.dart';
import '/configs/injectiondepency/injection.dart';
import '/services/locals/local_storage_service.dart';

import '/constants/app_export.dart';

class Utils {
  static changeLangue(Langue langue) {
    sl<LocalStorageServices>().userSelectedLang = langue.name;
    Get.updateLocale(getLangue(langue));
  }

  static Locale getLangue(Langue langue) {
    switch (langue) {
      case Langue.fr:
        {
          return const Locale('fr', 'FR');
        }
      case Langue.en:
        {
          return const Locale('en', 'US');
        }

      case Langue.ar:
        {
          return const Locale('ar', 'SA');
        }

      default:
        return const Locale('fr', 'FR');
    }
  }

  static showDialog({
    String? body,
    String? title,
    String? iconSvg,
    String? textButtonConfirm,
    String? textButtonCancel,

    /// si content choisi remplace tout
    Widget? content,
    Function()? onConfirm,
  }) {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(8), content: content);
  }

  static showWigetDialog(
    Widget body,
  ) {
    Get.defaultDialog(content: body);
  }

  static double maxValue(List<double> values) {
    double maxValue =
        values.reduce((currMax, value) => value > currMax ? value : currMax);
    return maxValue;
  }

  static bool isToday(DateTime date) {
    return date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day;
  }

  static String getFractionValue(double value) {
    switch (value) {
      case 20:
        return "1/5";
      case 40:
        return "2/5";
      case 60:
        return "3/5";
      case 80:
        return "4/5";
      case 100:
        return "5/5";
      default:
        return "0";
    }
  }

  static String cardStringView(String cardNumber) {
    String maskedCardNumber =
        '************${cardNumber.substring(cardNumber.length - 4)}';
    // Insérer un espace après chaque groupe de 4 chiffres
    maskedCardNumber = maskedCardNumber.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)} ");
    return maskedCardNumber;
  }

  static bool isURLorPath(String input) {
    Uri? uri = Uri.tryParse(input);
    if (uri != null && (uri.scheme == 'http' || uri.scheme == 'https')) {
      return true;
    }
    File file = File(input);
    if (file.existsSync()) {
      return false;
    }

    return false;
  }

  static Langue convertLagueToEnum(String value) {
    return Langue.values.firstWhere(
      (e) => e.toString().split('.')[1] == value,
    );
  }

  static String decodeUnicodeToArabic(String input) {
    return json.decode('"$input"');
  }

  static String getFrenchName(String englishTranslation) {
    return sourateTraductionsFr[englishTranslation] ?? englishTranslation;
  }

  static String addTimeToString(String timeStr,
      {int hoursToAdd = 0, int minutesToAdd = 0}) {
    DateTime time = DateTime.parse("2000-01-01T$timeStr:00");
    DateTime newTime =
        time.add(Duration(hours: hoursToAdd, minutes: minutesToAdd));
    String formatted =
        "${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}";

    return formatted;
  }

  static Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Impossible de lancer $url';
    }
  }

  static partager(String data) {
    Share.share(data, subject: 'Ourdeen');
  }
}

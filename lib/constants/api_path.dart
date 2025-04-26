class ApiPath {
  static const String baseUrlDev = "https://api.alquran.cloud/v1/"; // Dev
  static const String baseUrlProd = "https://api.alquran.cloud/v1/"; // Prod
  static const String baseUrlLocal = "https://api.alquran.cloud/v1/"; // local ou test
  static const String baseUrlImage = "http://"; // base image url

  // time for requests
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;

  // lien Api
  static const String login = 'login';
  static const String signup = 'signup';
  static const String surahs = 'surah';
  static const String pages = 'page';
  static const String quran = 'quran/ar.alafasy';
  static String sourateTraductionText(int idSourate, String langue) =>
      'surah/$idSourate/$langue';


  // liste des languages
  // https://api.alquran.cloud/v1/edition/type/translation

  // liste des languages audio text
  // https://api.alquran.cloud/v1/edition/format/audio  [text, audio]

  // Coran exemple text french
  // https://api.alquran.cloud/v1/quran/fr.hamidullah

  // Coran exemple audio et text arabic
  // https://api.alquran.cloud/v1/quran/ar.alafasy

  // liste des sourates
  // https://api.alquran.cloud/v1/surah
  // https://api.alquran.cloud/v1/surah/112/ar.alafasy

  // info sur la sourate
  // https://api.alquran.cloud/v1/surah/1
  // par langue et audio
  // https://api.alquran.cloud/v1/surah/1/fr.hamidullah [language]

  // la page du coran
  // https://api.alquran.cloud/v1/page/[numer de la page]/[language]
}

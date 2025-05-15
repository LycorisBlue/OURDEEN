import 'package:get/route_manager.dart';
import '/data/models/sourate.dart';
import '/configs/routes/page_name.dart';

class MyNavigation {
  static void goToHome() {
    Get.offAllNamed(MyRoutes.initial);
  }

  static void goToLogin() {
    Get.offAllNamed(MyRoutes.login);
  }

  static void goToRegister() {
    Get.toNamed(MyRoutes.register);
  }

  static void goToProfile() {
    Get.toNamed(MyRoutes.profile);
  }

  static void goToQuibla() {
    Get.toNamed(MyRoutes.quibla);
  }

  static void goToDetailCoran(Sourate sourate) {
    Get.toNamed(MyRoutes.coranDetail, arguments: sourate);
  }

  static void goToDetailPriere(String title, String imagePath) {
    Get.toNamed(MyRoutes.priereDetail,
        arguments: {"title": title, "imagePath": imagePath});
  }

  static void goToListStepSalat() {
    Get.toNamed(MyRoutes.prayerStep);
  }

  static void goToDuas() {
    Get.toNamed(MyRoutes.duas);
  }

  static void goToZakkat() {
    Get.toNamed(MyRoutes.zakkat);
  }

  static void goToTasbih() {
    Get.toNamed(MyRoutes.tasbih);
  }

   static void goToName99() {
    Get.toNamed(MyRoutes.name99);
  }

   static void goToPremium() {
    Get.toNamed(MyRoutes.premium);
  }

   static void goToNotification() {
    Get.toNamed(MyRoutes.notification);
  }

   static void goToGenre() {
    Get.toNamed(MyRoutes.genre);
  }

   static void goToCouleur() {
    Get.toNamed(MyRoutes.couleur);
  }

   static void goToLanguage() {
    Get.toNamed(MyRoutes.language);
  }

  static void goToFavorites() {
    Get.toNamed(MyRoutes.favorites);
  }

  static void goToPrivacyPolicy() {
    Get.toNamed(MyRoutes.privacyPolicy);
  }

  static void goToTermsOfService() {
    Get.toNamed(MyRoutes.termsOfService);
  }

  static void goTo404Page() {
    Get.offAllNamed(MyRoutes.unknownRoute);
  }
}

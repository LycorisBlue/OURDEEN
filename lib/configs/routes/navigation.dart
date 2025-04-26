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

  static void goToQuibla() {
    Get.toNamed(MyRoutes.quibla);
  }

  static void goToDetailCoran(Sourate sourate) {
    Get.toNamed(MyRoutes.coranDetail, arguments: sourate);
  }

  static void goTo404Page() {
    Get.offAllNamed(MyRoutes.unknownRoute);
  }
}

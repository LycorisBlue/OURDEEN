import 'package:get/get.dart';
import '/app/quibla/controllers/quibla_crontroller.dart';
import '/app/home/controllers/player_controller.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';
import '/app/home/controllers/home_crontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BNavigationController());
    Get.lazyPut(() => PrayerTimeController());
    Get.lazyPut(() => QuiblaController());
  }
}

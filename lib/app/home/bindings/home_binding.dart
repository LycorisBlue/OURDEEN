import 'package:get/get.dart';
import '/app/home/controllers/coran_controller.dart';
import '/app/quibla/controllers/quibla_crontroller.dart';
import '/app/home/controllers/prayer_controller.dart';
import '/app/home/controllers/home_crontroller.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BNavigationController());
    Get.lazyPut(() => PrayerTimeController());
    Get.lazyPut(() => QuiblaController());
    Get.lazyPut(() => CoranController());
  }
}

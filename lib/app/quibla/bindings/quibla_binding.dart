import 'package:get/get.dart';
import '/app/quibla/controllers/quibla_crontroller.dart';

class QuiblaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuiblaController());
  }
}

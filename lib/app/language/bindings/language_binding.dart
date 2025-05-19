import 'package:get/get.dart';
import '/app/language/controllers/language_crontroller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController());
  }
}

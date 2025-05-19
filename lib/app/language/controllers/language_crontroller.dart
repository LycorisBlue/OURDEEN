import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:our_deen/constants/app_export.dart';
import 'package:our_deen/constants/assets_path.dart';
import '/services/networks/apis/api_controller_operation.dart';

enum LanguageEvent { initial, logoutClicked }

class LanguageController extends GetxController
    with ApiControllerOperationMixin {
  // final languageResponse = sl<AuthRepository>();
  Rx<LanguageEvent> languageEvent = LanguageEvent.initial.obs;

  final RxnString _selectedLanguage = RxnString(null);
  String? get selectedLanguage => _selectedLanguage.value;

  final List<Map<String, String>> languages = [
    {'name': 'Arabic', 'value': 'ar', 'flag': AppFlag.sa},
    {'name': 'Francais', 'value': 'fr', 'flag': AppFlag.fr},
    {'name': 'English', 'value': 'en', 'flag': AppFlag.um},
  ];

  @override
  void onInit() {
    super.onInit();
    ever(apiStatus, fireState);
  }

  @override
  onClose() {
    super.onClose();
  }

  void selectLanguage(String language) {
    _selectedLanguage.value = language;
    print("Language selected: $language");
     Utils.changeLangue(Utils.convertLagueToEnum(language));
  }

  mapEventToState(LanguageEvent event, ApiState state) {
    switch (event) {
      case LanguageEvent.initial:
        switch (state) {
          case ApiState.loading:
            break;

          case ApiState.success:
            if (kDebugMode) {
              print("========ca marche=======");
              print("data: $dataResponse");
            }
            break;
          case ApiState.failure:
            break;
        }
        break;

      default:
    }
  }

  fireState(ApiState languageApiState) {
    mapEventToState(languageEvent.value, languageApiState);
  }
}

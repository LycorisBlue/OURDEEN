import 'package:get/get.dart';

class HomeController extends GetxController {
  // Variables réactives
  var selectedTab = 'Translittéra..'.obs;
  var fontSize = 16.0.obs;
  var isFavorite = false.obs;

  // Méthode pour changer l'onglet sélectionné
  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  // Méthode pour basculer l'état favori
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void changeFontSize(double size) {
    fontSize.value = size;
  }
}

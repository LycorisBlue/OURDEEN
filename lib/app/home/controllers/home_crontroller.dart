import 'package:get/get.dart';

class HomeController extends GetxController {
  // Variables réactives
  var selectedTab = 'Translittéra..'.obs;
  var fontSize = 16.0.obs;
  var isFavorite = false.obs;

  // Contenus pour chaque mode
  var arabicContent = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ".obs;

  var frenchContent = "Au nom d'Allah, le Tout Miséricordieux, le Très Miséricordieux.".obs;

  var transliterationContent = "Bismillahi r-rahmani r-rahim".obs;

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

  // Renvoie le contenu approprié selon l'onglet sélectionné
  String getCurrentContent() {
    switch (selectedTab.value) {
      case 'Arabe':
        return arabicContent.value;
      case 'Traduction':
        return frenchContent.value;
      case 'Translittéra..':
        return transliterationContent.value;
      default:
        return transliterationContent.value;
    }
  }
}

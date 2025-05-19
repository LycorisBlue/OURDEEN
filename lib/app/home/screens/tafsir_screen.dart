import '/constants/app_export.dart';
import '/constants/assets_path.dart';
import '/data/models/sourate.dart';

class TafsirScreen extends StatelessWidget {
  const TafsirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer la sourate passée en argument
    final Sourate sourate = Get.arguments ??
        Sourate(
          number: 1,
          name: "الفاتحة",
          englishName: "Al-Fatiha",
          englishNameTranslation: "The Opening",
          revelationType: RevelationType.mequoi,
          ayahs: [],
        );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "TAFSIR",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(0.7),
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                ],
              ),
            ),

            // Main content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Tafsir",
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: AppFont.poppins,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "تفسير",
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: AppFont.arabeV1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Image section
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Image.asset(
                          AppImage.pictureTafsir,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Tafsir content
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Titre de la sourate
                          Text(
                            "Tafsir de Sourate ${Utils.getFrenchName(sourate.englishNameTranslation)}",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: AppFont.poppins,
                            ),
                          ),
                          SizedBox(height: 16),

                          // Contenu du Tafsir
                          Text(
                            "Tafsir (arabe : تفسير tafsir, « explication ») est le terme arabe pour désigner une exégèse du Coran. Le tafsir du Coran, basé sur les hadiths, ne relève que du sens apparent (zâhir) du texte sacré, sans s'attacher aux interprétations ésotériques (bâtin). Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.white,
                              fontFamily: AppFont.poppins,
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          // Ajouter d'autres paragraphes spécifiques à la sourate
                          SizedBox(height: 16),
                          Text(
                            "L'interprétation de cette sourate selon les savants musulmans met en évidence plusieurs points importants concernant les enseignements qu'elle contient. Les exégètes y voient des leçons fondamentales pour la foi et la pratique religieuse.",
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.white,
                              fontFamily: AppFont.poppins,
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          // Bouton d'ajout aux favoris
                          SizedBox(height: 30),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Action pour ajouter aux favoris
                                Get.snackbar(
                                  "Favoris",
                                  "Tafsir ajouté aux favoris",
                                  backgroundColor: AppColors.secondaryColor,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  margin: EdgeInsets.all(20),
                                  duration: Duration(seconds: 2),
                                );
                              },
                              icon: Icon(Icons.favorite_border),
                              label: Text("Ajouter aux favoris"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondaryColor,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryColor : Colors.grey,
            size: 24,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              fontFamily: AppFont.poppins,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

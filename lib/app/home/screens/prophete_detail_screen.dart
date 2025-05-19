import 'package:our_deen/constants/assets_path.dart';

import '/constants/app_export.dart';

class PropheteDetailScreen extends StatelessWidget {
  const PropheteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer les informations du prophète passées en argument
    final Map<String, dynamic> prophete = Get.arguments ??
        {
          'name': 'Mahomet',
          'arabicName': 'محمد',
          'period': '570-632',
          'description': 'Le dernier prophète de l\'Islam',
          'longDescription':
              'Mahomet (محمد), né vers 570 à La Mecque et mort le 8 juin 632 à Médine, est le prophète de l\'islam. Selon la tradition islamique, il reçoit, à partir de l\'an 610 environ, une révélation divine qui forme le Coran. Il unifie l\'Arabie en une seule communauté religieuse et fonde la première dynastie musulmane.',
        };

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
                    "L'HISTOIRE DES PROPHÈTES",
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
                      child: Text(
                        "L'histoire de ${prophete['name']}",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                    ),

                    // Image section
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Image.asset(
                          AppImage.pictureProphetBanner,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Contenu textuel
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      color: AppColors.primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Période
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Période: ${prophete['period']}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFont.poppins,
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          // Contenu complet
                          Text(
                            prophete['longDescription'] ??
                                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia",
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.white,
                              fontFamily: AppFont.poppins,
                            ),
                            textAlign: TextAlign.justify,
                          ),

                          // Indicateur audio (sans fonctionnalité active)
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDarkColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                // Bouton play fictif
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(width: 16),
                                // Texte
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Écouter l'histoire de ${prophete['name']}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: AppFont.poppins,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "20:45 mins",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white.withOpacity(0.7),
                                          fontFamily: AppFont.poppins,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Bouton d'ajout aux favoris
                          SizedBox(height: 30),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Action pour ajouter aux favoris
                                Get.snackbar(
                                  "Favoris",
                                  "Histoire ajoutée aux favoris",
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
}

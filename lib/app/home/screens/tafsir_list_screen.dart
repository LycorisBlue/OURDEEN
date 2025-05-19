import 'package:our_deen/configs/routes/page_name.dart';
import 'package:our_deen/constants/assets_path.dart';

import '/constants/app_export.dart';
import '/app/home/controllers/coran_controller.dart';

class TafsirListScreen extends StatelessWidget {
  TafsirListScreen({super.key});

  final coranController = Get.find<CoranController>();

  @override
  Widget build(BuildContext context) {
    // Chargement des sourates si nécessaire
    if (coranController.corans == null || coranController.corans!.value.sourates.listeSourates.isEmpty) {
      coranController.getListSourate();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Liste des sourates",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: AppFont.poppins,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          // Bannière en haut
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Text(
              "Sélectionnez une sourate pour consulter son Tafsir",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
                fontFamily: AppFont.poppins,
              ),
            ),
          ),

          // Liste des sourates
          Expanded(
            child: Obx(() {
              if (coranController.isLoadingGetSourate.value || coranController.corans == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }

              final sourates = coranController.corans!.value.sourates.listeSourates;

              return ListView.builder(
                itemCount: sourates.length,
                itemBuilder: (context, index) {
                  final sourate = sourates[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigation vers l'écran de Tafsir avec la sourate sélectionnée
                      Get.toNamed(MyRoutes.tafsir, arguments: sourate);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            // Numéro de la sourate
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "${sourate.number}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            // Nom de la sourate
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Utils.getFrenchName(sourate.englishNameTranslation),
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: AppFont.poppins,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        Utils.decodeUnicodeToArabic(sourate.name),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.primaryColor,
                                          fontFamily: AppFont.arabeV1,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "${sourate.ayahs.length} versets",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontFamily: AppFont.poppins,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Icône de flèche pour indiquer qu'on peut cliquer
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

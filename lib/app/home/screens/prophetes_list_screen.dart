import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class ProphetesListScreen extends StatelessWidget {
  const ProphetesListScreen({super.key});

  // Liste des prophètes avec leurs informations
  final List<Map<String, dynamic>> prophetes = const [
    {'name': 'Mahomet', 'arabicName': 'محمد', 'period': '570-632', 'description': 'Le dernier prophète de l\'Islam'},
    {
      'name': 'Ibrahim (Abraham)',
      'arabicName': 'إبراهيم',
      'period': 'Époque ancienne',
      'description': 'Le père des monothéistes'
    },
    {'name': 'Musa (Moïse)', 'arabicName': 'موسى', 'period': 'Époque ancienne', 'description': 'Le prophète qui a reçu la Torah'},
    {'name': 'Issa (Jésus)', 'arabicName': 'عيسى', 'period': '1-33', 'description': 'Le prophète qui a reçu l\'Injil (Évangile)'},
    {'name': 'Nuh (Noé)', 'arabicName': 'نوح', 'period': 'Époque ancienne', 'description': 'Le prophète de l\'arche'},
    {
      'name': 'Dawud (David)',
      'arabicName': 'داود',
      'period': 'Époque ancienne',
      'description': 'Le prophète qui a reçu les Psaumes'
    },
    {'name': 'Sulayman (Salomon)', 'arabicName': 'سليمان', 'period': 'Époque ancienne', 'description': 'Le prophète roi'},
    {'name': 'Yusuf (Joseph)', 'arabicName': 'يوسف', 'period': 'Époque ancienne', 'description': 'Le prophète de la beauté'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Histoire des Prophètes",
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
          SizedBox(height: 16),

          // Liste des prophètes
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: prophetes.length,
              itemBuilder: (context, index) {
                final prophete = prophetes[index];
                return GestureDetector(
                  onTap: () {
                    // Navigation vers la page détaillée du prophète
                    MyNavigation.goToPropheteDetail(prophete);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Image commune pour chaque carte
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImage.pictureProphetBanner),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                color: Colors.black.withOpacity(0.3),
                                child: Center(
                                  child: Text(
                                    prophete['arabicName'],
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: AppFont.arabeV1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Informations du prophète
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                prophete['name'],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: AppFont.poppins,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                prophete['description'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontFamily: AppFont.poppins,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

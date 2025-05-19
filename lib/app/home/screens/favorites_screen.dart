// lib/app/home/screens/favorites_screen.dart
import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button and notification
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),

            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Mes favoris",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFont.poppins,
                ),
              ),
            ),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "Mes outils favoris",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFont.poppins,
                ),
              ),
            ),

            // Favorite tools grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 8, // Réduire l'espacement pour compenser les marges
                mainAxisSpacing: 8, // Réduire l'espacement pour compenser les marges
                childAspectRatio: 1.4,
                children: [
                  _buildFavoriteToolCard(
                    "Temps de prières",
                    AppIcon.iconMuslimPro,
                  ),
                  _buildFavoriteToolCard(
                    "Alarme Fajr",
                    AppIcon.iconAlarmeFajr,
                  ),
                  _buildFavoriteToolCard(
                    "Lire le Coran",
                    AppIcon.iconBook,
                  ),
                  _buildFavoriteToolCard(
                    "Duas",
                    AppIcon.iconVector,
                  ),
                ],
              ),
            ),
            // Favorite sourates section title
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
              child: Text(
                "Mes Sourates préférées du Coran",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFont.poppins,
                ),
              ),
            ),

            // Favorite sourates list container
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppRadiusStyle.roundedBorder16,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          _buildFavoriteSourateCard(
                            number: 18,
                            title: "Sourate Al-Kahf",
                            reciter: "Sheikh Mishary Rashid Al-Afasy",
                            translation: "Arabe avec traduction en Français",
                            duration: "15min",
                          ),
                          SizedBox(height: 12),
                          _buildFavoriteSourateCard(
                            number: 1,
                            title: "Sourate Al-Fatiha",
                            reciter: "Sheikh Mishary Rashid Al-Afasy",
                            translation: "Arabe avec traduction en Français",
                            duration: "22min",
                          ),
                          SizedBox(height: 12),
                          _buildFavoriteSourateCard(
                            number: 112,
                            title: "Sourate Al-Ikhlas",
                            reciter: "Sheikh Mishary Rashid Al-Afasy",
                            translation: "Arabe seulement",
                            duration: "15min",
                          ),
                        ],
                      ),
                    ),

                    // See all button
                    CustomButton(
                      margin: EdgeInsets.only(top: 16),
                      text: "Voir toutes les Sourates favorites",
                      variant: ButtonVariant.Primary,
                      shape: ButtonShape.RoundedBorder12,
                      onTap: () {},
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

Widget _buildFavoriteToolCard(String title, String svgPath) {
    return Container(
      margin: EdgeInsets.all(8), // Ajouter une marge pour éviter que les cartes se touchent
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none, // Permettre au contenu de dépasser les limites
        children: [
          // Content
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomImageView(
                      svgPath: svgPath,
                      width: 24,
                      height: 24,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Lorem ipsum dolor sit amet, consectet",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade700,
                    fontFamily: AppFont.poppins,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Position heart icon in top-left, overlapping the card corner
          Positioned(
            top: -8, // Ajuster pour que la moitié du cercle soit visible
            left: -8, // Ajuster pour que la moitié du cercle soit visible
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: CustomImageView(
                  svgPath: AppIcon.iconFavoris,
                  width: 18,
                  height: 18,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildFavoriteSourateCard({
    required int number,
    required String title,
    required String reciter,
    required String translation,
    required String duration,
  }) {
    return Row(
      children: [
        // Sourate number container
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: AppRadiusStyle.roundedBorder6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SOURATE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFont.poppins,
                ),
              ),
              Text(
                number.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFont.poppins,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        // Sourate details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                      fontFamily: AppFont.poppins,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Text(
                reciter,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFont.poppins,
                ),
              ),
              SizedBox(height: 2),
              Text(
                translation,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                  fontFamily: AppFont.poppins,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

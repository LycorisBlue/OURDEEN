import '/app/home/controllers/home_crontroller.dart';
import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class CoranTab extends StatelessWidget {
  CoranTab({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                Text(
                  "Hadiths",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildTabButton('Arabe')),
                      const SizedBox(width: 4),
                      Expanded(child: _buildTabButton('Traduction')),
                      const SizedBox(width: 4),
                      Expanded(child: _buildTabButton('Translittéra..')),
                    ],
                  ),
                ),
                _buildCoranContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bouton retour
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: CustomImageView(
              svgPath: AppIcon.iconArrowLeft,
              width: 22,
              height: 22,
              color: AppColors.whiteYellowColor,
            ),
          ),

          // Icône notification
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: CustomImageView(
              svgPath: AppIcon.iconNotification,
              width: 22,
              height: 22,
              color: AppColors.whiteYellowColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text) {
    return Obx(() {
      bool isSelected = controller.selectedTab.value == text;

      return GestureDetector(
        onTap: () => controller.changeTab(text),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : AppColors.secondaryColor,
            borderRadius: AppRadiusStyle.roundedBorder8,
            border: isSelected ? null : Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColors.primaryDarkColor : Colors.white,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCoranContent() {
    return Column(
      children: [
        // Première section: Titre de la sourate et "À PROPOS"
        SizedBox(height: 16),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  margin: EdgeInsets.only(left: 6, right: 6, top: 8),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.4),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Titre arabe
                      Text(
                        "سُورَةُ الفَاتِحَة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Titre latin
                      Text(
                        "AL-FATIHA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Sous-titre
                      Text(
                        "Sûrat al-Fâtihah",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                    ],
                  ),
                ),

                // Icône de favoris dans le coin supérieur droit
                Positioned(
                  top: 0,
                  right: 0,
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.toggleFavorite(),
                      child: Container(
                        decoration:
                            BoxDecoration(color: AppColors.whiteColor, borderRadius: AppRadiusStyle.circleBorder30, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.4),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]),
                        padding: const EdgeInsets.all(8),
                        child: CustomImageView(
                          svgPath: AppIcon.iconFavoris,
                          width: 20,
                          height: 20,
                          color: controller.isFavorite.value ? Colors.amber : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Section À propos
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: AppColors.whiteYellowColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "À PROPOS",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: AppFont.poppins,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Al-Fatiha (arabe : سُورَةُ الفَاتِحَة, Sûrat al-Fâtihah) est la sourate d'ouverture du Coran, le livre sacré des musulmans. Composée de sept versets, elle met l'accent sur la souveraineté et la miséricorde d'Allah.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black.withValues(alpha: 0.9),
                      height: 1.4,
                      fontFamily: AppFont.poppins,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Curseur de taille de police
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Taille de police",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: AppFont.poppins,
                ),
              ),
              SizedBox(
                width: 180,
                child: Obx(
                  () => Slider(
                    value: controller.fontSize.value,
                    min: 14.0,
                    max: 30.0,
                    secondaryTrackValue: 30.0,
                    activeColor: AppColors.secondaryColor,
                    inactiveColor: Colors.white.withValues(alpha: 0.9),
                    onChanged: (value) => controller.changeFontSize(value),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Second bloc: Contenu du Coran avec sélection du tab
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.whiteYellowColor,
            borderRadius: AppRadiusStyle.roundedBorder8,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(() {
              switch (controller.selectedTab.value) {
                case 'Arabe':
                  return Column(
                    children: [
                      Text(
                        controller.arabicContent.value,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: controller.fontSize.value,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),
                    ],
                  );
                case 'Traduction':
                  return Column(
                    children: [
                      Text(
                        controller.frenchContent.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: controller.fontSize.value - 2,
                          color: Colors.black87,
                          fontFamily: AppFont.poppins,
                          height: 1.6,
                        ),
                      ),
                    ],
                  );
                default: // Translittération
                  return Column(
                    children: [
                      // Texte translittération
                      Text(
                        controller.transliterationContent.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: controller.fontSize.value - 2,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          height: 1.6,
                        ),
                      ),
                      const Divider(
                        height: 30,
                        thickness: 1,
                        color: Colors.black26,
                      ),
                      // Traduction
                      Text(
                        controller.frenchContent.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: controller.fontSize.value - 4,
                          color: Colors.black87,
                          fontFamily: AppFont.poppins,
                          height: 1.4,
                        ),
                      ),
                    ],
                  );
              }
            }),
          ),
        ),
      ],
    );
  }
}

import 'package:shimmer/shimmer.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';
import '../../widgets/community_card.dart';
import '../../widgets/divine_names_card.dart';
import '/constants/assets_path.dart';
import '/constants/app_export.dart';
import '/app/home/controllers/prayer_controller.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final controller = Get.find<PrayerTimeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildNextPrayerCountdown(),
            _buildDuaCard(),
            Padding(
                padding: EdgeInsets.only(left: 22, top: 20, bottom: 15),
                child: Obx(
                  () => controller.isLoading.value
                      ? Shimmer.fromColors(
                          baseColor: AppColors.greyColor,
                          highlightColor: AppColors.primaryColor,
                          child: SizedBox(
                            width: 50,
                            height: 20,
                          ))
                      : Text(
                          "Aujourd'hui ${controller.currentLocation.value}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                )),
            Obx(() => controller.isLoading.value
                ? Shimmer.fromColors(
                    baseColor: AppColors.greyColor,
                    highlightColor: AppColors.primaryColor,
                    child: SizedBox(
                      width: 50,
                      height: 20,
                    ))
                : controller.prayerTimes.value == null
                    ? SizedBox()
                    : _buildPrayerTimesGrid()),
            _buildCategorySection(),
            _buildDivineNamesSection(),
            _buildCommunitySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomImageView(
                  imagePath: AppImage.profil,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "${"Welcome".tr} Abou Bakar !",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              MyNavigation.goToQuibla();
            },
            child: Container(
              width: 45,
              height: 45,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  border: Border.all(color: AppColors.blackColor, width: 1),
                  borderRadius: AppRadiusStyle.roundedBorder12,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.4),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: CustomImageView(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(top: 8),
                svgPath: AppIcon.iconMessage,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextPrayerCountdown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => controller.isLoading.value
              ? Shimmer.fromColors(
                  baseColor: AppColors.greyColor,
                  highlightColor: AppColors.primaryColor,
                  child: SizedBox(
                    width: 50,
                    height: 20,
                  ))
              : Text(
                  "${"Next Prayer".tr} ${controller.remainingTime}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          SizedBox(height: 5),
          Obx(() => controller.isLoading.value
              ? Shimmer.fromColors(
                  baseColor: AppColors.greyColor,
                  highlightColor: AppColors.primaryColor,
                  child: SizedBox(
                    width: 50,
                    height: 20,
                  ))
              : Text(
                  "${controller.nextPrayer} ${controller.nextPrayerTime}",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          SizedBox(height: 5),
          Obx(() => Text(
                controller.hijriDate.value,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildDuaCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          CustomImageView(
            imagePath: AppImage.citation,
          ),
          // Positioned(
          //   left: 10,
          //   bottom: 0,
          //   top: 0,
          //   child: Center(
          //     child: Icon(
          //       Icons.arrow_back_ios,
          //       color: Get.theme.primaryColor,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   right: 10,
          //   bottom: 0,
          //   top: 0,
          //   child: Center(
          //     child: Icon(
          //       Icons.arrow_forward_ios,
          //       color: Get.theme.primaryColor,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesGrid() {
    final times = controller.prayerTimes.value!;
    String currentPrayer = controller.getCurrentPrayer({
      'fajr': times.fajr,
      'dhuhr': times.dhuhr,
      'asr': times.asr,
      'maghrib': times.maghrib,
      'isha': times.isha,
    });
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 20),
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1.0,
      children: [
        _buildPrayerTimeCard("Fajr", times.fajr, currentPrayer == "Fajr"),
        _buildPrayerTimeCard(
            "Shoroq",
            Utils.addTimeToString(times.fajr, hoursToAdd: 1, minutesToAdd: 35),
            currentPrayer == "Shoroq"),
        _buildPrayerTimeCard("Dhuhr", times.dhuhr, currentPrayer == "Dhuhr"),
        _buildPrayerTimeCard("Asr", times.asr, currentPrayer == "Asr"),
        _buildPrayerTimeCard(
            "Maghrib", times.maghrib, currentPrayer == "Maghrib"),
        _buildPrayerTimeCard("Isha", times.isha, currentPrayer == "Isha"),
      ],
    );
  }

  Widget _buildPrayerTimeCard(String name, String time, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryDarkColor : Colors.black,
        borderRadius: AppRadiusStyle.circleBorder20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            svgPath: AppIcon.iconNotification,
            height: 32,
            color: AppColors.whiteColor,
            alignment: Alignment.topRight,
          ),
          Spacer(),
          Text(
            name.tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}


Widget _buildCategorySection() {

  // État pour suivre si nous affichons en mode grille ou ligne
  final RxBool showAsGrid = false.obs;

  // Définir les éléments de catégorie une seule fois
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Qibla',
      'color': AppColors.primaryColor,
      'icon': Icons.explore,
      'onTap': () => Get.find<BNavigationController>().changeTabIndex(2),
      'customIcon': null
    },
    {
      'title': 'Prières',
      'color': AppColors.primaryDarkColor,
      'icon': Icons.timer,
      'onTap': () => MyNavigation.goToListStepSalat(),
      'customIcon': CustomImageView(
        svgPath: AppIcon.iconPriere,
        color: null, // Sera défini dynamiquement
        margin: EdgeInsets.all(12),
      )
    },
    {
      'title': 'Duas',
      'color': AppColors.secondaryColor,
      'icon': Icons.volunteer_activism,
      'onTap': () => MyNavigation.goToDuas(),
      'customIcon': null
    },
    {
      'title': 'Tafsir',
      'color': AppColors.brightRedColor,
      'icon': Icons.menu_book_outlined,
      'onTap': () => MyNavigation.goToTafsirList(),
      'customIcon': null
    },
    {
      'title': 'Prophètes',
      'color': AppColors.navyBlueColor,
      'icon': Icons.history_edu,
      'onTap': () => MyNavigation.goToProphetesList(),
      'customIcon': null
    },
    {
      'title': 'Tasbih',
      'color': AppColors.primaryDarkColor,
      'icon': Icons.grain,
      'onTap': () => MyNavigation.goToTasbih(),
      'customIcon': null
    },
    {
      'title': 'Zakat',
      'color': AppColors.primaryLightColor,
      'icon': Icons.calculate,
      'onTap': () => MyNavigation.goToZakkat(),
      'customIcon': null
    },
  ];

  return Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your sections".tr,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Basculer entre l'affichage en grille et en ligne
                    showAsGrid.value = !showAsGrid.value;
                  },
                  child: Text(
                    showAsGrid.value ? "Voir moins" : "See more".tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          // Affichage en fonction du mode sélectionné
          if (!showAsGrid.value)
            // Affichage en ligne (horizontale)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: categories.map((category) {
                  // Gérer la couleur de l'icône personnalisée
                  Widget? customIcon = category['customIcon'];
                  if (customIcon != null && customIcon is CustomImageView) {
                    customIcon = CustomImageView(
                      svgPath: customIcon.svgPath,
                      color: category['color'],
                      margin: customIcon.margin,
                      width: customIcon.width,
                      height: customIcon.height,
                    );
                  }

                  return _buildCategoryItem(
                    category['title'],
                    category['color'],
                    category['icon'],
                    onTap: category['onTap'],
                    customIcon: customIcon,
                  );
                }).toList(),
              ),
            )
          else
            // Affichage en grille
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  // Gérer la couleur de l'icône personnalisée
                  Widget? customIcon = category['customIcon'];
                  if (customIcon != null && customIcon is CustomImageView) {
                    customIcon = CustomImageView(
                      svgPath: customIcon.svgPath,
                      color: category['color'],
                      margin: customIcon.margin,
                      width: customIcon.width,
                      height: customIcon.height,
                    );
                  }

                  return _buildCategoryItem(
                    category['title'],
                    category['color'],
                    category['icon'],
                    onTap: category['onTap'],
                    customIcon: customIcon,
                  );
                },
              ),
            ),
        ],
      ));
}

Widget _buildCategoryItem(String title, Color color, IconData icon, {VoidCallback? onTap, Widget? customIcon}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2),
            ),
            child: customIcon ??
                Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
          ),
          SizedBox(height: 8),
          Text(
            title.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _buildDivineNamesSection() {
  return DivineNamesCard(
    arabicName: "الغفار",
    latinName: "Al-Ghaffār",
    frenchMeaning: "L'Infini Pardonneur",
    onTap: () {
      MyNavigation.goToName99();
    },
    onShowDetails: () {
      MyNavigation.goToName99();
    },
    onShare: () {
      Utils.partager(
          "Les 99 nom d'Allah : je partage avec vous le nom de Al-Ghaffār - L'Infini Pardonneur");
    },
    onMore: () {
      // Action pour le bouton More (trois points)
    },
  );
}

Widget _buildCommunitySection() {
  return CommunityCard(
    onJoinFacebook: () {
      Utils.launchURL('https://web.facebook.com/OurDeenofficiel');
    },
    onMoreOptions: () {
      // Action pour le bouton More (trois points)
    },
  );
}

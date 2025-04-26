import 'package:shimmer/shimmer.dart';
import '/data/models/sourate.dart';
import '/app/home/controllers/coran_controller.dart';
import '/constants/app_export.dart';
import '/constants/assets_path.dart';

class DetailCoranScreen extends StatelessWidget {
  DetailCoranScreen({super.key});

  final controller = Get.find<CoranController>();
  final sourate = Get.arguments as Sourate;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    controller.initWithSourate(sourate);
    return MyAppScaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: _buildHeader(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                Utils.getFrenchName(sourate.englishNameTranslation),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTabButton('Arabe'),
                    const SizedBox(width: 4),
                    _buildTabButton('Traduction'),
                    const SizedBox(width: 4),
                    _buildTabButton('Translittération'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  return false;
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics:
                      const BouncingScrollPhysics(), // Effet de rebond pour un défilement plus fluide
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: _buildCoranContent(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {
          scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.keyboard_arrow_up, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
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
        ),
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
    );
  }

  Widget _buildTabButton(String text) {
    return Obx(() {
      bool isSelected = controller.selectedTab.value == text;

      return GestureDetector(
        onTap: () => controller.changeTab(text),
        child: Container(
          // width: 0.3.sw,
          constraints: BoxConstraints(minWidth: 0.25.sw),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.whiteColor : AppColors.secondaryColor,
            borderRadius: AppRadiusStyle.roundedBorder8,
            border: isSelected
                ? null
                : Border.all(
                    color: Colors.white.withValues(alpha: 0.3), width: 1),
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
                color: isSelected
                    ? AppColors.primaryDarkColor
                    : AppColors.whiteColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 14.sp,
                fontFamily: AppFont.poppins),
          ),
        ),
      );
    });
  }

  Widget _buildCoranContent() {
    return Column(
      children: [
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
                      Text(
                        Utils.decodeUnicodeToArabic(sourate.name),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFont.arabeV1),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        Utils.getFrenchName(sourate.englishNameTranslation),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Sûrat ${sourate.englishName}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.toggleFavorite(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: AppRadiusStyle.circleBorder30,
                            boxShadow: [
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
                          color: controller.isFavorite.value
                              ? Colors.amber
                              : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                    "${sourate.englishName.toUpperCase()} (arabe : ${Utils.decodeUnicodeToArabic(sourate.name)} Sûrat ${sourate.englishName}) est la ${sourate.number}e sourate du Coran. Elle est composée de ${sourate.ayahs.length} versets, révélée à La ${sourate.revelationType == RevelationType.mequoi ? 'Mecque' : 'Medina'}, ce qui en fait d'elle une sourate ${sourate.revelationType == RevelationType.mequoi ? 'meccoise' : 'medinoise'}",
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.whiteYellowColor,
            borderRadius: AppRadiusStyle.roundedBorder8,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sourate.ayahs.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: scrollController,
                  builder: (context, child) {
                    return TweenAnimationBuilder(
                      duration: Duration(milliseconds: 300),
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 20),
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Obx(
                              () => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: Text(
                                  Utils.decodeUnicodeToArabic(
                                      sourate.ayahs[index].text),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: controller.fontSize.value,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFont.arabeV1,
                                    height: 1.8,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xFFDAAF4E),
                                            width: 2),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFDAAF4E),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFDAAF4E),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDAAF4E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => controller.selectedTab.value == 'Traduction'
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 5),
                                      child: controller
                                              .isLoadingGetSourateTraduction
                                              .value
                                          ? Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor:
                                                  Colors.grey.shade100,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1),
                                                  ),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12.0),
                                                child: Text(
                                                    "------ -------- ------- ---"),
                                              ),
                                            )
                                          : Text(
                                              controller
                                                  .sourateTraduction!
                                                  .value
                                                  .sourate
                                                  .ayahs[index]
                                                  .text,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey,
                                                height: 1.5,
                                              ),
                                            ),
                                    )
                                  : SizedBox.shrink(),
                            ),
                            Obx(
                              () => controller.selectedTab.value ==
                                      'Translittération'
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 5),
                                      child: controller
                                              .isLoadingGetSourateTraduction
                                              .value
                                          ? Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor:
                                                  Colors.grey.shade100,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1),
                                                  ),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12.0),
                                                child: Text(
                                                    "------ -------- ------- ---"),
                                              ),
                                            )
                                          : Text(
                                              controller
                                                  .sourateTranslitteration!
                                                  .value
                                                  .sourate
                                                  .ayahs[index]
                                                  .text,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey,
                                                height: 1.5,
                                              ),
                                            ),
                                    )
                                  : SizedBox.shrink(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius:
                                          AppRadiusStyle.roundedBorder4,
                                    ),
                                    child: Text(
                                      "${sourate.number}:${index + 1}",
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Obx(() {
                                        final isCurrentlyPlaying =
                                            controller.isPlaying.value &&
                                                controller
                                                        .currentPlayingAyatIndex
                                                        .value ==
                                                    index;

                                        return Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                isCurrentlyPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                color: Colors.grey.shade700,
                                                size: 34,
                                              ),
                                              onPressed: () => controller
                                                  .playAyat(index, sourate),
                                            ),

                                            // Indicateur circulaire de progression (visible seulement si en cours de lecture)
                                            if (isCurrentlyPlaying)
                                              Positioned.fill(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: controller
                                                              .audioDuration
                                                              .value >
                                                          0
                                                      ? controller.audioProgress
                                                              .value /
                                                          controller
                                                              .audioDuration
                                                              .value
                                                      : 0,
                                                  strokeWidth: 2,
                                                  color:
                                                      AppColors.secondaryColor,
                                                ),
                                              ),
                                          ],
                                        );
                                      }),
                                      IconButton(
                                        icon: Icon(
                                          Icons.share,
                                          color: Colors.grey.shade700,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.copy,
                                          color: Colors.grey.shade700,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 30,
                              thickness: 1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

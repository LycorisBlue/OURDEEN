import '/constants/assets_path.dart';
import '/app/home/controllers/player_controller.dart';
import '/constants/app_export.dart';

class PriereTab extends StatelessWidget {
  PriereTab({super.key});
  final controller = Get.find<PrayerTimeController>();
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
                  "Temps de prière",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildNextPrayerCard(),
                _buildCurrentTime(),
                _buildPrayerTimesList(),
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

  Widget _buildNextPrayerCard() {
    return Container(
      width: 1.sw,
      height: 0.3.sh,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [AppColors.primaryColor, AppColors.primaryLightColor],
          stops: [0.04, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: AppRadiusStyle.roundedBorder8,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              bottom: -40,
              right: 0,
              child: CustomImageView(
                width: 0.5.sw,
                margin: EdgeInsets.zero,
                alignment: Alignment.bottomRight,
                imagePath: AppImage.mosque,
              )),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  "LA PROCHAINE PRIÈRE EST",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFont.poppins,
                  ),
                ),
                SizedBox(height: 10),
                Obx(() => Text(
                      controller.nextPrayer.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFont.poppins,
                      ),
                    )),
                SizedBox(height: 5),
                Obx(() => Text(
                      controller.nextPrayerTime.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 70.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFont.poppins,
                      ),
                    )),
                SizedBox(height: 10),
                Obx(() => Container(
                      // padding: EdgeInsets.all(4),
                      // decoration: BoxDecoration(
                      //   borderRadius: AppRadiusStyle.roundedBorder12,
                      //   color: AppColors.blackColor.withValues(alpha: 0.1),
                      // ),
                      child: Text(
                        "DANS ${controller.minutesRemaining.value} MINUTES",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFont.poppins,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          // Silhouette de la mosquée
        ],
      ),
    );
  }

  Widget _buildCurrentTime() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: Center(
        child: Text(
          "Il est actuellement 14h52",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerTimesList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteYellowColor,
        borderRadius: AppRadiusStyle.roundedBorder8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Heures de prières d'aujourd'hui",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 15),
          _buildPrayerTimeRow("Fajr", "4:45"),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Dhuhr", "12:12"),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Asr", "16:32"),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Maghreb", "17:43"),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Isha", "19:19"),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeRow(String name, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

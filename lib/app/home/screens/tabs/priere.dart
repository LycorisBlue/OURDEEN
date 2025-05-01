import '/constants/assets_path.dart';
import '../../controllers/prayer_controller.dart';
import '/constants/app_export.dart';

class PriereTab extends StatelessWidget {
  PriereTab({super.key});
  final controller = Get.find<PrayerTimeController>();
  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      appBar: AppBar(
        leadingWidth: 1.sw,
        leading: _buildHeader(),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Obx(() {
          controller.currentTime.value;
          if (controller.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(color: Colors.white));
          }

          if (controller.prayerTimes.value == null) {
            return Center(
              child: Text(
                'Aucune donnée disponible',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  _buildNextPrayerCard(),
                  _buildCurrentTime(),
                  _buildPrayerTimesList(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Temps de prière",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Bouton retour
          // Container(
          //   width: 40,
          //   height: 40,
          //   padding: EdgeInsets.all(4),
          //   decoration: BoxDecoration(
          //     color: AppColors.primaryColor,
          //     shape: BoxShape.circle,
          //   ),
          //   child: CustomImageView(
          //     svgPath: AppIcon.iconArrowLeft,
          //     width: 22,
          //     height: 22,
          //     color: AppColors.whiteYellowColor,
          //   ),
          // ),

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
      height: 0.35.sh,
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
                SizedBox(height: 5),
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
                Text(
                  controller.nextPrayerTime.value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFont.poppins,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  controller.remainingTime.value,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFont.poppins,
                  ),
                ),
              ],
            ),
          ),
          // Silhouette de la mosquée
        ],
      ),
    );
  }

  Widget _buildCurrentTime() {
    DateTime now = DateTime.now();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: Center(
        child: Text(
          "Il est actuellement ${now.hour.toString().padLeft(2, '0')}h${now.minute.toString().padLeft(2, '0')}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerTimesList() {
    final times = controller.prayerTimes.value!;
    final nextPrayer = controller.getNextPrayer({
      'fajr': times.fajr,
      'dhuhr': times.dhuhr,
      'asr': times.asr,
      'maghrib': times.maghrib,
      'isha': times.isha,
    });
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
          _buildPrayerTimeRow("Fajr", times.fajr,
              isNext: nextPrayer['name'] == "Fajr",
              timeRemaining: nextPrayer['duration']),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Dhuhr", times.dhuhr,
              isNext: nextPrayer['name'] == "Dhuhr",
              timeRemaining: nextPrayer['duration']),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Asr", times.asr,
              isNext: nextPrayer['name'] == "Asr",
              timeRemaining: nextPrayer['duration']),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Maghreb", times.maghrib,
              isNext: nextPrayer['name'] == "Maghreb",
              timeRemaining: nextPrayer['duration']),
          Divider(height: 22, color: Colors.black12),
          _buildPrayerTimeRow("Isha", times.isha,
              isNext: nextPrayer['name'] == "Isha",
              timeRemaining: nextPrayer['duration']),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeRow(String name, String time,
      {bool isNext = false, Duration? timeRemaining}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                color: isNext ? AppColors.primaryColor : Colors.black87,
                fontWeight: isNext ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isNext && timeRemaining != null) ...[
              SizedBox(width: 8),
              Text(
                "(${timeRemaining.inHours.toString().padLeft(2, '0')}:${(timeRemaining.inMinutes % 60).toString().padLeft(2, '0')}:${(timeRemaining.inSeconds % 60).toString().padLeft(2, '0')})",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.greyColor,
                ),
              ),
            ]
          ],
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 16,
            color: isNext ? AppColors.primaryColor : Colors.black87,
            fontWeight: isNext ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

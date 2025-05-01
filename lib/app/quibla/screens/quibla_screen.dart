import 'dart:math';

import '/constants/assets_path.dart';
import '/app/quibla/controllers/quibla_crontroller.dart';
import '/constants/app_export.dart';

class QuiblaScreen extends StatelessWidget {
  QuiblaScreen({super.key});

  final controller = Get.find<QuiblaController>();

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      backgroundColor: AppColors.bgColor,
       appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leadingWidth: 1.sw,
        leading: _buildHeader(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }

                  if (!controller.isLocationGranted.value) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Permission de localisation requise',
                            style: TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: controller.checkLocationPermission,
                            child: const Text('Accorder la permission'),
                          ),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Obx(() => Text(
                              '${controller.qiblaDirection.value.toStringAsFixed(0)}°',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        const SizedBox(height: 5),
                        Image.asset(
                          AppImage.kaaba,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 20),
                        Obx(() => Transform.rotate(
                              angle: ((controller.compassHeading.value -
                                      controller.qiblaDirection.value) *
                                  (pi / 180)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    AppImage.compass,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 20),
                        const Text(
                          'Faites pivoter votre téléphone\njusqu\'à ce que la Kaaba soit au centre',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.4),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImage.kaaba,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() => Text(
                                        '${controller.qiblaDirection.value.toStringAsFixed(0)}°',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  const Text(
                                    'La Mecque, Arabie Saoudite',
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
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
                  "Quibla",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          // GestureDetector(
          //   onTap: () => Get.back(),
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     padding: EdgeInsets.all(6),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //     ),
          //     child: CustomImageView(
          //       svgPath: AppIcon.iconArrowLeft,
          //       width: 22,
          //       height: 22,
          //       color: AppColors.secondaryColor,
          //     ),
          //   ),
          // ),
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CustomImageView(
              svgPath: AppIcon.iconNotification,
              width: 22,
              height: 22,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

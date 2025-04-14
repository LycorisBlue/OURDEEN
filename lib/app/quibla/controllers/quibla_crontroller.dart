import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '/services/networks/apis/api_controller_operation.dart';

enum QuiblaEvent { initial, logoutClicked }

class QuiblaController extends GetxController with ApiControllerOperationMixin {
  // final quiblaResponse = sl<AuthRepository>();
  Rx<QuiblaEvent> quiblaEvent = QuiblaEvent.initial.obs;
  final RxDouble compassHeading = 0.0.obs;
  final RxDouble qiblaDirection = 0.0.obs;
  final RxBool isLocationGranted = false.obs;
  final RxBool isLoading = false.obs;
  final kaabaLat = 21.4225;
  final kaabaLng = 39.8262;
  StreamSubscription<CompassEvent>? compassSubscription;


  @override
  void onInit() {
    super.onInit();
    checkLocationPermission();
    ever(apiStatus, fireState);
  }


  @override
  onClose() {
    compassSubscription?.cancel();
    super.onClose();
  }


  Future<void> checkLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final request = await Geolocator.requestPermission();
      isLocationGranted.value = request != LocationPermission.denied && 
                               request != LocationPermission.deniedForever;
    } else {
      isLocationGranted.value = permission != LocationPermission.denied && 
                               permission != LocationPermission.deniedForever;
    }
    
    if (isLocationGranted.value) {
      initQiblaDirection();
      initCompass();
    }
  }

  void initCompass() {
    compassSubscription = FlutterCompass.events?.listen((event) {
      compassHeading.value = event.heading ?? 0;
      isLoading.value = false;
    });
  }

  Future<void> initQiblaDirection() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      qiblaDirection.value = calculateQiblaDirection(
        position.latitude, 
        position.longitude
      );
    } catch (e) {
      print('Error getting location: $e');
      isLoading.value = false;
    }
  }

  double calculateQiblaDirection(double latitude, double longitude) {
    // Convert to radians
    final latRad = latitude * (pi / 180);
    final longRad = longitude * (pi / 180);
    final kaabaLatRad = kaabaLat * (pi / 180);
    final kaabaLongRad = kaabaLng * (pi / 180);

    // Calculate qibla direction using the spherical law of cosines
    final y = sin(kaabaLongRad - longRad);
    final x = cos(latRad) * tan(kaabaLatRad) - sin(latRad) * cos(kaabaLongRad - longRad);
    var direction = atan2(y, x) * (180 / pi);
    
    // Convert to 0-360 range
    direction = (direction + 360) % 360;
    
    return direction;
  }


  mapEventToState(QuiblaEvent event, ApiState state) {
    switch (event) {
      case QuiblaEvent.initial:
        switch (state) {
          case ApiState.loading:
            break;

          case ApiState.success:
            if (kDebugMode) {
              print("========ca marche=======");
              print("data: $dataResponse");
            }
            break;
          case ApiState.failure:
            break;
          default:
        }
        break;

      default:
    }
  }

  fireState(ApiState quiblaApiState) {
    mapEventToState(quiblaEvent.value, quiblaApiState);
  }
}

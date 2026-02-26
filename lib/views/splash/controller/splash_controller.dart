import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';


class SplashController extends GetxController {

  void splashTimer(){
    Timer(const Duration(seconds: 2), () {
      // Get.off(() => const OnboardingScreen());
      Get.offNamed( AppRoutes.onboardingScreen);
    });
  }

}
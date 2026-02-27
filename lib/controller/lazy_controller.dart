import 'package:get/get.dart';

import '../views/auth/controller/auth_controller.dart';
import '../views/bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../views/splash/controller/splash_controller.dart';



class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(SplashController());
    Get.put(AuthController());
    Get.put(BottomNavController());


  }
}
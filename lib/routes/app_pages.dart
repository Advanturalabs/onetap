import 'package:get/get.dart';
import '../views/auth/screen/forgot_Password_screen.dart';
import '../views/auth/screen/login_screen.dart';
import '../views/auth/screen/reset_password_screen.dart';
import '../views/onboarding/screen/onboarding_screen.dart';
import '../views/splash/screen/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () =>  SplashScreen()),
    GetPage(name: AppRoutes.onboardingScreen, page: () =>  OnboardingScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () =>  LoginScreen()),
    GetPage(name: AppRoutes.forgotPasswordScreen, page: () =>  ForgotPasswordScreen()),
    GetPage(name: AppRoutes.resetPasswordScreen, page: () =>  ResetPasswordScreen()),

  ];
}
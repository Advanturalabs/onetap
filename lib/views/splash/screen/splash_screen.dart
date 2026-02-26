import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/constants/app_assets.dart';
import 'package:sizer/sizer.dart';
import '../../../AppTheme/app_theme.dart';
import '../../../constants/app_text_style.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    splashController.splashTimer();
  }

  SplashController splashController=Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                  AppAssets.logo,
                width: 70.w,
              ),
            ],
          ),
        )
    );
  }
}
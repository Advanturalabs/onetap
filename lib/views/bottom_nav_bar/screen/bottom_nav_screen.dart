import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/constants/app_assets.dart';
import 'package:onetap/constants/app_text_style.dart';
import 'package:onetap/views/home/screen/home_screen.dart';
import 'package:sizer/sizer.dart';
import '../../training/screen/training_screen.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  BottomNavController bottomNavController = Get.find();

  final List<Widget> pages = const [
    HomeScreen(),
    Center(child: Text('Events Screen')),
    TrainingScreen(),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) return;
          if (bottomNavController.selectedIndex.value == 0) {
            // SystemNavigator.pop();
          } else {
            bottomNavController.changeIndex(0);
          }
        },
        child: Scaffold(
          backgroundColor: AppTheme.primaryColor,
          body: pages[bottomNavController.selectedIndex.value],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(75),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.blackColor.withOpacity(0.4),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 1.5.h,
            ),
            child: GNav(
              selectedIndex: bottomNavController.selectedIndex.value,
              onTabChange: (index) => bottomNavController.changeIndex(index),

              // Active tab styling
              activeColor: AppTheme.primaryColor,
              tabBackgroundColor: AppTheme.secondaryColor,
              color: AppTheme.greyColor,
              tabBorderRadius: 44,
              gap: 6,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle: AppTextStyle.font14Weight500TextStyle.copyWith(color: AppTheme.primaryColor),

              // iconSize: 40,

              tabs: [
                GButton(
                  icon: Icons.home,
                  leading: Image.asset(
                    AppAssets.home_icon,
                    width: 20,
                    height: 20,
                    color: bottomNavController.selectedIndex.value == 0
                        ? AppTheme.primaryColor
                        : AppTheme.greyColor,
                  ),
                  text: 'Home',
                ),

                GButton(
                  icon: Icons.grid_view_outlined,
                  leading: Image.asset(
                    AppAssets.qr_icon,
                    width: 20,
                    height: 20,
                    color: bottomNavController.selectedIndex.value == 1
                        ? AppTheme.primaryColor
                        : AppTheme.greyColor,
                  ),
                  text: 'Events',
                ),

                GButton(
                  icon: Icons.description_outlined,
                  leading: Image.asset(
                    AppAssets.training_icon,
                    width: 20,
                    height: 20,
                    color: bottomNavController.selectedIndex.value == 2
                        ? AppTheme.primaryColor
                        : AppTheme.greyColor,
                  ),
                  text: 'Training',
                ),

                GButton(
                  icon: Icons.person_outline,
                  leading: Image.asset(
                    AppAssets.user_icon,
                    width: 20,
                    height: 20,
                    color: bottomNavController.selectedIndex.value == 3
                        ? AppTheme.primaryColor
                        : AppTheme.greyColor,
                  ),
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

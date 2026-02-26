import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/constants/app_assets.dart';
import 'package:onetap/routes/app_routes.dart';

import '../widgets/onboarding_background.dart';
import '../widgets/onboarding_bottom_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'image': AppAssets.onboarding1bg,
      'heading': 'Welcome to ONETAP',
      'description':
      'Everything you need to manage trainings, attendance, and progress — all in one app.',
    },
    {
      'image': AppAssets.onboarding2bg,
      'heading': 'Mark Attendance in Seconds',
      'description':
      'Simply scan the session QR code to clock in and out — no manual steps.',
    },
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for background images
          PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
            itemBuilder: (context, index) {
              return OnboardingBackground(
                imagePath: pages[index]['image'] ?? '',
              );
            },
          ),

          OnboardingBottomContent(
            heading: pages[currentPage]['heading']!,
            description: pages[currentPage]['description']!,
            totalPages: pages.length,
            currentPage: currentPage,
            onNext: (){
              if (currentPage < pages.length - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Get.toNamed(AppRoutes.loginScreen);
              }
            },
          ),
        ],
      ),
    );
  }
}
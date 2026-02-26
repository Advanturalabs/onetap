import 'package:flutter/material.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/constants/layout_spacing.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const OnboardingPageIndicator({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final bool isActive = index == currentPage;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heighttwelve / 2),
          child: Container(
            width: isActive ? LayoutSpacing.heightTwenty_Four : LayoutSpacing.heightEight,
            height: LayoutSpacing.heightEight,
            decoration: BoxDecoration(
              color: isActive ? AppTheme.secondaryColor : AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(isActive ? 3 : 4),
            ),
          ),
        );
      }),
    );
  }
}
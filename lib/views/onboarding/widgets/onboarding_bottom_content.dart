import 'package:flutter/material.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/app_widgets/custom_button.dart';
import 'package:onetap/constants/app_text_style.dart';
import 'package:onetap/constants/layout_spacing.dart';

import 'onboarding_page_indicator.dart';

class OnboardingBottomContent extends StatelessWidget {
  final String heading;
  final String description;
  final int totalPages;
  final int currentPage;
  final VoidCallback onNext;

  const OnboardingBottomContent({
    super.key,
    required this.heading,
    required this.description,
    required this.totalPages,
    required this.currentPage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(LayoutSpacing.heightSixteen),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              heading,
              style: AppTextStyle.font24Weight700TextStyle
                  .copyWith(color: AppTheme.primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: LayoutSpacing.heightSixteen),
            Text(
              description,
              style: AppTextStyle.font20Weight500TextStyle
                  .copyWith(color: AppTheme.primaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: LayoutSpacing.heightFourty_Eight),
            OnboardingPageIndicator(
              totalPages: totalPages,
              currentPage: currentPage,
            ),
            SizedBox(height: LayoutSpacing.heightTwenty_Four),
            CustomButton(
              Text: 'Next',
              onTap: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
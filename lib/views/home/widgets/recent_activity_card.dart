import 'package:flutter/material.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/constants/app_text_style.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/layout_spacing.dart';

class RecentActivityCard extends StatelessWidget {
  final String activityText;
  final VoidCallback onTap;
  final String iconPath;
  final Color iconColor;
  final Color iconBackgroundColor;

  const RecentActivityCard({
    super.key,
    required this.activityText,
    required this.onTap,
    required this.iconPath,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(
          horizontal: LayoutSpacing.heightSixteen,
          vertical: LayoutSpacing.heighttwelve,
        ),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(LayoutSpacing.heighttwelve),
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(LayoutSpacing.heightEight)
              ),
              child: Center(
                child: Image.asset(
                  iconPath,
                  width: 18,
                  height: 18,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Text(
                activityText,
                style: AppTextStyle.font16Weight600MediumTextStyle.copyWith(color: AppTheme.darkGreyColor)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
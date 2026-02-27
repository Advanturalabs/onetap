import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/layout_spacing.dart';

class InfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String number;
  final VoidCallback onTap;

  const InfoCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutSpacing.heightSixteen,
          vertical: LayoutSpacing.heighttwelve,
        ),
        decoration: BoxDecoration(
          color: AppTheme.grey100Color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  iconPath,
                  color: AppTheme.greyColor,
                ),
              ),
            ),
            SizedBox(height: LayoutSpacing.heighttwelve),
            Text(
              title,
              style: AppTextStyle.font14Weight500TextStyle
                  .copyWith(color: AppTheme.darkGreyColor),
            ),
            SizedBox(height: LayoutSpacing.heightFour),
            Text(
              number,
              style: AppTextStyle.font20Weight700TextStyle
                  .copyWith(color: AppTheme.blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
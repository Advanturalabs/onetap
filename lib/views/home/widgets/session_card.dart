import 'package:flutter/material.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/constants/app_text_style.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/layout_spacing.dart';

class SessionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String sessionDate;
  final String sessionDuration;
  final VoidCallback onTap;

  const SessionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.sessionDate,
    required this.sessionDuration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(LayoutSpacing.heighttwelve),
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.font16Weight500TextStyle.copyWith(color: AppTheme.darkGreyColor),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyle.font12Weight400TextStyle.copyWith(color: AppTheme.greyColor)
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen),
              child: Divider(
                height: 1,
                thickness: 1,
                color: AppTheme.borderColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Session Date',
                        style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(
                        sessionDate,
                        style: AppTextStyle.font12Weight400BoldTextStyle.copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Session Duration',
                          style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(
                        sessionDuration,
                        style: AppTextStyle.font12Weight400BoldTextStyle.copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


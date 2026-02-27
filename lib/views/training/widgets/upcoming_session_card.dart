import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/layout_spacing.dart';

enum SessionStatus { upcoming, completed, mandatory }

class UpcomingSessionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String launchDate;
  final String sessionTime;
  final String totalTime;
  final SessionStatus status;
  final VoidCallback onTap;

  const UpcomingSessionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.launchDate,
    required this.sessionTime,
    required this.totalTime,
    required this.status,
    required this.onTap,
  });

  String get statusLabel {
    switch (status) {
      case SessionStatus.upcoming:
        return 'Upcoming';
      case SessionStatus.completed:
        return 'Completed';
      case SessionStatus.mandatory:
        return 'Mandatory';
    }
  }

  Color get statusBackgroundColor {
    switch (status) {
      case SessionStatus.upcoming:
        return AppTheme.lightYellowColor;
      case SessionStatus.completed:
        return AppTheme.lightGreenColor;
      case SessionStatus.mandatory:
        return AppTheme.lightRedColor;
    }
  }

  Color get _statusTextColor {
    switch (status) {
      case SessionStatus.upcoming:
        return AppTheme.yellowColor;
      case SessionStatus.completed:
        return AppTheme.greenColor;
      case SessionStatus.mandatory:
        return AppTheme.redColor;
    }
  }

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
              padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyle.font16Weight500TextStyle.copyWith(color: AppTheme.darkGreyColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: LayoutSpacing.heightSix+LayoutSpacing.heightFour,
                          vertical: LayoutSpacing.heightFour,
                        ),
                        decoration: BoxDecoration(
                          color: statusBackgroundColor,
                          borderRadius: BorderRadius.circular(LayoutSpacing.heightSixteen),
                        ),
                        child: Text(
                          statusLabel,
                          style: AppTextStyle.font14Weight500TextStyle
                              .copyWith(color: _statusTextColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: LayoutSpacing.heightTwo),
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
              padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Launch Date',
                          style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(
                        launchDate,
                        style: AppTextStyle.font12Weight400BoldTextStyle.copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Session Time',
                          style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(
                        sessionTime,
                        style: AppTextStyle.font12Weight400BoldTextStyle.copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Time',
                          style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(
                        totalTime,
                        style: AppTextStyle.font12Weight400BoldTextStyle.copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/layout_spacing.dart';

enum AttendanceStatus { completed, partial, absent }

class AttendanceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String sessionDate;
  final String? clockIn;
  final String? clockOut;
  final AttendanceStatus status;
  final VoidCallback onTap;

  const AttendanceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.sessionDate,
    this.clockIn,
    this.clockOut,
    required this.status,
    required this.onTap,
  });

  String get statusLabel {
    switch (status) {
      case AttendanceStatus.completed:
        return 'Completed';
      case AttendanceStatus.partial:
        return 'Partial';
      case AttendanceStatus.absent:
        return 'Absent';
    }
  }

  Color get statusBackgroundColor {
    switch (status) {
      case AttendanceStatus.completed:
        return AppTheme.lightGreenColor;
      case AttendanceStatus.partial:
        return AppTheme.lightYellowColor;
      case AttendanceStatus.absent:
        return AppTheme.lightRedColor;
    }
  }

  Color get statusTextColor {
    switch (status) {
      case AttendanceStatus.completed:
        return AppTheme.greenColor;
      case AttendanceStatus.partial:
        return AppTheme.yellowColor;
      case AttendanceStatus.absent:
        return AppTheme.redColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
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
                              .copyWith(color: statusTextColor),
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
                        'Session Date',
                          style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(
                        sessionDate,
                        style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Clock In',
                          style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(
                        clockIn ?? '--',
                        style: AppTextStyle.font12Weight500TextStyle.copyWith(
                          color: clockIn != null
                              ? AppTheme.darkGreyColor
                              : AppTheme.darkGreyColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 1.2.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Clock Out',
                          style: AppTextStyle.font12Weight500TextStyle.copyWith(color: AppTheme.greyColor)
                      ),
                      Text(

                        clockOut ?? '--',
                        style: AppTextStyle.font12Weight500TextStyle.copyWith(
                          color: clockOut != null
                              ? AppTheme.darkGreyColor
                              : AppTheme.darkGreyColor,
                        ),
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/constants/app_text_style.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../app_widgets/custom_app_header.dart';
import '../../../constants/layout_spacing.dart';

class DetailedTrainingScreen extends StatefulWidget {
  const DetailedTrainingScreen({super.key});

  @override
  State<DetailedTrainingScreen> createState() => _DetailedTrainingScreenState();
}

class _DetailedTrainingScreenState extends State<DetailedTrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: LayoutSpacing.screenPaddingWithoutBottom,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppHeader(
              title: 'Session Detail',
              onBackPressed: () {Get.back();},
              showUpload: false,
              onUploadPressed: () { },
            ),
            SizedBox(height: LayoutSpacing.heightSixteen),
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(
                horizontal: LayoutSpacing.heightSixteen,
                vertical: LayoutSpacing.heighttwelve,
              ),
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.borderColor,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Session Title ",
                    style: AppTextStyle.font16Weight700TextStyle
                        .copyWith(color: AppTheme.blackColor),
                  ),
                  SizedBox(height: LayoutSpacing.heightFour),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: LayoutSpacing.heightSix + LayoutSpacing.heightFour,
                          vertical: LayoutSpacing.heightFour,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.lightGreenColor,
                          borderRadius: BorderRadius.circular(LayoutSpacing.heightSixteen),
                        ),
                        child: Text(
                          'Training',
                          style: AppTextStyle.font14Weight500TextStyle
                              .copyWith(color: AppTheme.greenColor),
                        ),
                      ),
                      SizedBox(width: LayoutSpacing.heighttwelve),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: LayoutSpacing.heightSix + LayoutSpacing.heightFour,
                          vertical: LayoutSpacing.heightFour,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.lightYellowColor,
                          borderRadius: BorderRadius.circular(LayoutSpacing.heightSixteen),
                        ),
                        child: Text(
                          'Status',
                          style: AppTextStyle.font14Weight500TextStyle
                              .copyWith(color: AppTheme.brownColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: LayoutSpacing.heighttwelve),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 20, color: AppTheme.greyColor),
                      SizedBox(width: LayoutSpacing.heighttwelve),
                      Text(
                        'Date :',
                        style: AppTextStyle.font14Weight400TextStyle
                            .copyWith(color: AppTheme.greyColor),
                      ),
                      Text(
                        ' 25 Jan 2026',
                        style: AppTextStyle.font14Weight500TextStyle
                            .copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: LayoutSpacing.heighttwelve),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 20, color: AppTheme.greyColor),
                      SizedBox(width: LayoutSpacing.heighttwelve),
                      Text(
                        'Time :',
                        style: AppTextStyle.font14Weight400TextStyle
                            .copyWith(color: AppTheme.greyColor),
                      ),
                      Text(
                        ' 3:00 pm - 7:00 pm',
                        style: AppTextStyle.font14Weight500TextStyle
                            .copyWith(color: AppTheme.darkGreyColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: LayoutSpacing.heightSixteen),
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(
                horizontal: LayoutSpacing.heightSixteen,
                vertical: LayoutSpacing.heighttwelve,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(LayoutSpacing.heighttwelve),
                color: AppTheme.primaryColor,
                border: Border.all(color: AppTheme.borderColor),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(LayoutSpacing.heightFour),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(LayoutSpacing.heighttwelve),
                      border: Border.all(
                        color: AppTheme.borderColor,
                      )
                    ),

                    child:  QrImageView(
                      data: "session_id_or_unique_token_here",
                      version: QrVersions.auto,
                      size: 199,
                      backgroundColor: AppTheme.primaryColor,
                      dataModuleStyle: QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: AppTheme.lightGreyColor,
                      ),
                      eyeStyle: QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: AppTheme.lightGreyColor,
                      ),
                    ),

                  ),
                  SizedBox(height: LayoutSpacing.heightSixteen),
                  Text(
                    "Scan this QR code to mark your attendance",
                    style: AppTextStyle.font14Weight500TextStyle
                        .copyWith(color: AppTheme.purpleColor),
                  ),
                  SizedBox(height: LayoutSpacing.heightFour),
                  Text(
                    "Valid only for this session",
                    style: AppTextStyle.font12Weight400TextStyle
                        .copyWith(color: AppTheme.greyColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: LayoutSpacing.heightSixteen + LayoutSpacing.heightFour),
            Container(
              height: 78,
              padding: EdgeInsets.all(LayoutSpacing.heighttwelve),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(LayoutSpacing.heighttwelve),
                color: AppTheme.lightSecondaryColor,
                border: Border.all(color: AppTheme.secondaryColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: AppTheme.secondaryColor, size: 20),
                  SizedBox(width: LayoutSpacing.heighttwelve),
                  Expanded(
                    child: Text(
                      "Attendance will be available when the session starts. Make sure to arrive on time and scan the QR code.",
                      style: AppTextStyle.font12Weight500TextStyle
                          .copyWith(color: AppTheme.secondaryColor),
                    ),
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
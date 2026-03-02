import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/constants/app_text_style.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../app_widgets/custom_app_header.dart';
import '../../../constants/layout_spacing.dart';
import '../widgets/attendance_history_card.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
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
              showUpload: true,
              onBackPressed: () {Get.back();},
              onUploadPressed: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: LayoutSpacing.heightTwenty_Four),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve),
                            decoration: BoxDecoration(
                              color: AppTheme.lightGreenColor,
                              borderRadius: BorderRadius.circular(LayoutSpacing.heightSix+LayoutSpacing.heightFour),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Completed', style: AppTextStyle.font14Weight500TextStyle.copyWith(color: AppTheme.purpleColor),),
                                SizedBox(height: LayoutSpacing.heightSix,),
                                Text('30', style: AppTextStyle.font16Weight600TextStyle.copyWith(color: AppTheme.greenColor),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: LayoutSpacing.heightEight,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve),
                            decoration: BoxDecoration(
                              color: AppTheme.lightYellowColor,
                              borderRadius: BorderRadius.circular(LayoutSpacing.heightSix+LayoutSpacing.heightFour),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Partial', style: AppTextStyle.font14Weight500TextStyle.copyWith(color: AppTheme.purpleColor),),
                                SizedBox(height: LayoutSpacing.heightSix,),
                                Text('12', style: AppTextStyle.font16Weight600TextStyle.copyWith(color: AppTheme.yellowColor),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: LayoutSpacing.heightEight,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve),
                            decoration: BoxDecoration(
                              color: AppTheme.lightRedColor,
                              borderRadius: BorderRadius.circular(LayoutSpacing.heightSix+LayoutSpacing.heightFour),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Completed', style: AppTextStyle.font14Weight500TextStyle.copyWith(color: AppTheme.purpleColor),),
                                SizedBox(height: LayoutSpacing.heightSix,),
                                Text('5', style: AppTextStyle.font16Weight600TextStyle.copyWith(color: AppTheme.redColor),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: LayoutSpacing.heightSixteen),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: LayoutSpacing.heighttwelve),
                          child:  AttendanceCard(
                            title: 'Onboarding',
                            subtitle: 'Workshop',
                            sessionDate: '14 Feb 2027',
                            clockIn: '10 : 00 AM',
                            clockOut: '12 : 00 PM',
                            status: AttendanceStatus.completed,
                            onTap: () {},
                          ),
                        );
                      },
                    ),


                    // AttendanceCard(
                    //   title: 'Onboarding',
                    //   subtitle: 'Workshop',
                    //   sessionDate: '14 Feb 2027',
                    //   status: AttendanceStatus.absent,
                    //   onTap: () {},
                    // ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

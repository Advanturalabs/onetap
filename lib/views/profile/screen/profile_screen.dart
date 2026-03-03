import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/constants/app_text_style.dart';
import 'package:onetap/routes/app_routes.dart';
import 'package:onetap/views/profile/widgets/action_card.dart';
import 'package:sizer/sizer.dart';

import '../../../app_widgets/custom_image_handler.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/layout_spacing.dart';
import '../widgets/training_summary_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: LayoutSpacing.screenPaddingWithoutBottom,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Profile",style: AppTextStyle.font16Weight500TextStyle.copyWith(color: AppTheme.blackColor))),
            SizedBox(height: LayoutSpacing.heightTwenty_Four,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Personal Information",style: AppTextStyle.font16Weight400TextStyle.copyWith(color: AppTheme.blackColor)),
                    SizedBox(height: LayoutSpacing.heightSixteen,),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve),
                      decoration: BoxDecoration(
                          color: AppTheme.backgroundColor,
                          border: Border.all(color: AppTheme.borderColor),
                          borderRadius: BorderRadius.circular(LayoutSpacing.heighttwelve)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageHandler(
                                imagePath: '',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorAsset: AppAssets.profileAvatar,
                                loaderColor: AppTheme.secondaryColor,
                                loaderSize: 24,
                              ),
                              SizedBox(width: LayoutSpacing.heighttwelve),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Alex Morgan",style: AppTextStyle.font16Weight500TextStyle.copyWith(color: AppTheme.blackColor)),
                                  SizedBox(height: LayoutSpacing.heightFour),
                                  Text("Employee id here",style: AppTextStyle.font16Weight400TextStyle.copyWith(color: AppTheme.secondaryColor)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: LayoutSpacing.heightSixteen,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.greyColor.withOpacity(.05),
                                  borderRadius: BorderRadius.circular(LayoutSpacing.heightEight),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    AppAssets.calendar_icon,
                                  ),
                                ),
                              ),
                              SizedBox(width: LayoutSpacing.heightSixteen,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email",style: AppTextStyle.font14Weight400TextStyle.copyWith(color: AppTheme.greyColor)),
                                  Text("alex.morgan@company.com",style: AppTextStyle.font14Weight500TextStyle.copyWith(color: AppTheme.darkGreyColor)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: LayoutSpacing.heighttwelve),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.greyColor.withOpacity(.05),
                                  borderRadius: BorderRadius.circular(LayoutSpacing.heightEight),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    AppAssets.department_icon,
                                  ),
                                ),
                              ),
                              SizedBox(width: LayoutSpacing.heightSixteen,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Department",style: AppTextStyle.font14Weight400TextStyle.copyWith(color: AppTheme.greyColor)),
                                  Text("Information technology",style: AppTextStyle.font14Weight500TextStyle.copyWith(color: AppTheme.darkGreyColor)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: LayoutSpacing.heighttwelve),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.greyColor.withOpacity(.05),
                                  borderRadius: BorderRadius.circular(LayoutSpacing.heightEight),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    AppAssets.user_icon,
                                  ),
                                ),
                              ),
                              SizedBox(width: LayoutSpacing.heightSixteen,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Role",style: AppTextStyle.font14Weight400TextStyle.copyWith(color: AppTheme.greyColor)),
                                  Text("Senior Developer",style: AppTextStyle.font14Weight500TextStyle.copyWith(color: AppTheme.darkGreyColor)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: LayoutSpacing.heightSixteen,),
                    Text("Training Summary",style: AppTextStyle.font16Weight400TextStyle.copyWith(color: AppTheme.blackColor)),
                    SizedBox(height: LayoutSpacing.heightSixteen,),
                    TrainingSummaryCard(
                      iconPath: AppAssets.lock_icon,
                      iconColor: AppTheme.secondaryColor,
                      iconBgColor: AppTheme.lightSecondaryColor,
                      label: 'Total Training Hours',
                      value: '125',
                      onTap: () {},
                    ),
                    SizedBox(height: LayoutSpacing.heighttwelve),
                    TrainingSummaryCard(
                      iconPath: AppAssets.clock_icon,
                      iconColor: AppTheme.greenColor,
                      iconBgColor: AppTheme.lightGreenColor,
                      label: 'Mandatory Completed',
                      value: '25',
                      onTap: () {},
                    ),
                    SizedBox(height: LayoutSpacing.heighttwelve),
                    TrainingSummaryCard(
                      iconPath: AppAssets.training_icon,
                      iconColor: AppTheme.yellowColor,
                      iconBgColor: AppTheme.lightYellowColor,
                      label: 'Pending Trainings',
                      value: '4',
                      onTap: () {},
                    ),
                    SizedBox(height: LayoutSpacing.heightSixteen,),
                    Text("Attendance & Reports",style: AppTextStyle.font16Weight400TextStyle.copyWith(color: AppTheme.blackColor)),
                    SizedBox(height: LayoutSpacing.heightSixteen,),
                    ActionCard(
                      iconPath: AppAssets.clock_icon,
                      iconColor: AppTheme.greyColor,
                      iconBgColor: AppTheme.grey100Color,
                      label: 'View full attendance history ',
                      onTap: () {
                        Get.toNamed(AppRoutes.attendanceHistoryScreen);
                      },
                    ),
                    SizedBox(height: LayoutSpacing.heightSixteen,),
                    Text("Account Actions",style: AppTextStyle.font16Weight400TextStyle.copyWith(color: AppTheme.blackColor)),
                    SizedBox(height: LayoutSpacing.heightSixteen,),
                    ActionCard(
                      iconPath: AppAssets.lock_icon,
                      iconColor: AppTheme.greyColor,
                      iconBgColor: AppTheme.grey100Color,
                      label: 'Change Password',
                      onTap: () {
                        Get.toNamed(AppRoutes.changePasswordScreen);
                      },
                    ),
                    SizedBox(height: LayoutSpacing.heighttwelve),
                    ActionCard(
                      iconPath: AppAssets.logout_icon,
                      iconColor: AppTheme.greyColor,
                      iconBgColor: AppTheme.grey100Color,
                      label: 'Log Out',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

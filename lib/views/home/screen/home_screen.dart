import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../app_widgets/custom_image_handler.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/layout_spacing.dart';
import '../widgets/info_card.dart';
import '../widgets/recent_activity_card.dart';
import '../widgets/session_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: LayoutSpacing.screenPaddingWithoutBottom,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.greyColor,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CustomImageHandler(
                                imagePath: AppAssets.profileAvatar,
                                width: 48,
                                height: 48,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: LayoutSpacing.heightEight),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome',
                                style: AppTextStyle.font12Weight400TextStyle
                                    .copyWith(color: AppTheme.blackColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Michel Marshal!',
                                style: AppTextStyle.font16Weight600TextStyle
                                    .copyWith(color: AppTheme.blackColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.grey100Color,
                      border: Border.all(
                        color: AppTheme.borderColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(LayoutSpacing.heightEight),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(AppAssets.bell_icon),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 2.5.h),

              GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 121,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InfoCard(
                    iconPath: AppAssets.calendar_icon,
                    title: 'Upcoming Session',
                    number: '30',
                    onTap: () {},
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Session',
                    style: AppTextStyle.font16Weight500TextStyle
                        .copyWith(color: AppTheme.blackColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.upcomingSessionScreen);
                    },
                    child: Text(
                      'See All',
                      style: AppTextStyle.font16Weight400TextStyle
                          .copyWith(color: AppTheme.grey400Color),
                    ),
                  ),
                ],
              ),

              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: LayoutSpacing.heighttwelve),
                    child: SessionCard(
                      title: 'Marketing',
                      subtitle: 'Training',
                      sessionDate: '26 Jan 2026 - 2:00',
                      sessionDuration: '4 hours',
                      onTap: () {},
                    ),
                  );
                },
              ),

              SizedBox(height: LayoutSpacing.heighttwelve),
              
              Text(
                'Recent Activity',
                style: AppTextStyle.font16Weight500TextStyle
                    .copyWith(color: AppTheme.blackColor),
              ),

              SizedBox(height: LayoutSpacing.heighttwelve),

              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: LayoutSpacing.heighttwelve),
                    child: RecentActivityCard(
                      activityText: 'Fire Safety Training Checked In',
                      iconPath: AppAssets.clock_icon,
                      iconColor: AppTheme.greenColor,
                      iconBackgroundColor: AppTheme.lightGreenColor,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
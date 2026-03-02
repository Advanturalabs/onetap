import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/constants/app_text_style.dart';
import 'package:onetap/routes/app_routes.dart';
import '../../../AppTheme/app_theme.dart';
import '../../../constants/layout_spacing.dart';
import '../controller/training_controller.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/upcoming_session_card.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  TrainingController trainingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: LayoutSpacing.screenPaddingWithoutBottom,
        child: Column(
          children: [
            Center(
              child: Text(
                'Upcoming Session',
                style: AppTextStyle.font16Weight500TextStyle.copyWith(color: AppTheme.blackColor),
              ),
            ),
            SizedBox(height: LayoutSpacing.heightTwenty_Four,),
            Obx(
                  () => CustomCategoryTabBar(
                categories: trainingController.eventCategories,
                //                categories: eventController.eventCategoryList,
                initialIndex: trainingController.selectedCategoryIndex.value,
                onCategorySelected: (index) {
                  trainingController.selectEventCategory(index);
                },
              ),
            ),
            SizedBox(height: LayoutSpacing.heightSixteen+LayoutSpacing.heightFour,),

            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: LayoutSpacing.heighttwelve),
                      child:  UpcomingSessionCard(
                        title: 'Onboarding',
                        subtitle: 'Workshop',
                        launchDate: '14 Feb 2027',
                        sessionTime: '1:00 PM - 4:00 PM',
                        totalTime: '3 hours',
                        status: SessionStatus.mandatory,
                        onTap: () {
                          Get.toNamed(AppRoutes.detailedTrainingScreen);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

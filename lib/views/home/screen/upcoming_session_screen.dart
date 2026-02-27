import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/AppTheme/app_theme.dart';

import '../../../app_widgets/custom_app_header.dart';
import '../../../constants/layout_spacing.dart';
import '../widgets/session_card.dart';

class UpcomingSessionScreen extends StatefulWidget {
  const UpcomingSessionScreen({super.key});

  @override
  State<UpcomingSessionScreen> createState() => _UpcomingSessionScreenState();
}

class _UpcomingSessionScreenState extends State<UpcomingSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: LayoutSpacing.screenPaddingWithoutBottom,
        child: Column(
          children: [
            CustomAppHeader(
              title: 'Upcoming Session',
              onBackPressed: () {Get.back();},
            ),
            SizedBox(height: LayoutSpacing.heightSixteen,),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

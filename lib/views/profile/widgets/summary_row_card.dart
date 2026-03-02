import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/layout_spacing.dart';

class SummaryRowCard extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final String? value;
  final VoidCallback onTap;

  const SummaryRowCard({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: LayoutSpacing.heightSixteen, vertical: LayoutSpacing.heighttwelve),
        decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            border: Border.all(color: AppTheme.borderColor),
            borderRadius: BorderRadius.circular(LayoutSpacing.heighttwelve)
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(LayoutSpacing.heightEight)
              ),
              child: Center(
                child: Image.asset(
                  iconPath,
                  width: 20,
                  height: 20,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyle.font14Weight500TextStyle
                        .copyWith(color: AppTheme.greyColor),
                  ),
                  if (value != null && value!.isNotEmpty) ...[
                    SizedBox(height: 2),
                    Text(
                      value!,
                      style: AppTextStyle.font14Weight600TextStyle
                          .copyWith(color: AppTheme.blackColor),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
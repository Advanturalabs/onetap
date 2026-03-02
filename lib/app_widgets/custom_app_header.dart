import 'package:flutter/material.dart';

import '../AppTheme/app_theme.dart';
import '../constants/app_assets.dart';
import '../constants/app_text_style.dart';

class CustomAppHeader extends StatelessWidget {
  final String title;
  final bool showUpload;
  final VoidCallback onBackPressed;
  final VoidCallback onUploadPressed;



  const CustomAppHeader({
    Key? key,
    required this.title,
    required this.onBackPressed,
    required this.onUploadPressed,
    this.showUpload = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackPressed,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.grey100Color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AppAssets.arrow_back_icon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: AppTextStyle.font16Weight500TextStyle.copyWith(
                  color: AppTheme.blackColor,
                ),
              ),
            ),
          ),  showUpload
              ? GestureDetector(
            onTap: onUploadPressed,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.grey100Color,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.borderColor),
              ),
              child: Center(
                child: Image.asset(
                  AppAssets.upload_icon,
                  color: AppTheme.darkGreyColor,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          )
              : const SizedBox(width: 40),
        ],
      ),
    );
  }
}
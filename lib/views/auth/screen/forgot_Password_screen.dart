import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/app_widgets/custom_button.dart';
import 'package:onetap/app_widgets/custom_textfield.dart';
import 'package:onetap/constants/app_assets.dart';
import 'package:onetap/views/auth/controller/auth_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_validator.dart';
import '../../../constants/layout_spacing.dart';
import '../../../routes/app_routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController forgotEmailController = TextEditingController();

  final AuthController authController = Get.find();

  @override
  void dispose() {
    forgotEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background + Scrollable Content
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onboarding1bg),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 40.h,
                        left: LayoutSpacing.heightSixteen,
                        right: LayoutSpacing.heightSixteen),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot password?',
                          style: AppTextStyle.font24Weight700TextStyle
                              .copyWith(color: AppTheme.primaryColor),
                        ),
                        SizedBox(height: LayoutSpacing.heightEight),
                        Text(
                          'Enter your email and we\'ll send you a link to reset your password.',
                          style: AppTextStyle.font16Weight500TextStyle
                              .copyWith(color: AppTheme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: LayoutSpacing.heightSixteen),
                  Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(LayoutSpacing.heightThirty),
                        topRight: Radius.circular(LayoutSpacing.heightThirty),
                      ),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.all(LayoutSpacing.heightSixteen),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Email
                          Text(
                            'Email',
                            style: AppTextStyle.font20Weight500TextStyle
                                .copyWith(color: AppTheme.blackColor),
                          ),
                          SizedBox(height: LayoutSpacing.heightSix),
                          CustomTextField(
                            controller: forgotEmailController,
                            hintText: 'Enter your email',
                            validator: CustomValidator.email,
                          ),
                          SizedBox(height: 20.h),
                          CustomButton(
                            Text: 'Send Reset Link',
                            onTap: () {
                              print("Email : ${forgotEmailController.text}");
                              Get.toNamed(AppRoutes.resetPasswordScreen);

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 48,
            left: LayoutSpacing.heightSixteen,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                AppAssets.arrow_back_icon,
                color: AppTheme.primaryColor,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
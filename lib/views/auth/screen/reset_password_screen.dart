import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/AppTheme/app_theme.dart';
import 'package:onetap/app_widgets/custom_button.dart';
import 'package:onetap/app_widgets/custom_textfield.dart';
import 'package:onetap/constants/app_assets.dart';
import 'package:onetap/routes/app_routes.dart';
import 'package:onetap/views/auth/controller/auth_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_validator.dart';
import '../../../constants/layout_spacing.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final AuthController authController = Get.find();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
                          'Reset password',
                          style: AppTextStyle.font24Weight700TextStyle
                              .copyWith(color: AppTheme.primaryColor),
                        ),
                        SizedBox(height: LayoutSpacing.heightEight),
                        Text(
                          'Reset your password to secure your account',
                          style: AppTextStyle.font16Weight500TextStyle
                              .copyWith(color: AppTheme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: LayoutSpacing.heightThirty_two),
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
                            'New Password',
                            style: AppTextStyle.font14Weight400TextStyle
                                .copyWith(color: AppTheme.blackColor),
                          ),
                          SizedBox(height: LayoutSpacing.heightSix),

                          Obx(
                                () => CustomTextField(
                                  controller: newPasswordController,
                                  hintText: 'Enter new password',
                                  isObscure:
                                  authController.obscureNewPassword.value,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      authController.obscureNewPassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppTheme.greyColor,
                                      size: 16,
                                    ),
                                    onPressed:
                                    authController.toggleNewPasswordVisibility,
                                  ),
                                  validator: CustomValidator.password,
                                ),
                          ),
                          SizedBox(height: LayoutSpacing.heighttwelve),
                          Text(
                            'Confirm New Password',
                            style: AppTextStyle.font14Weight400TextStyle
                                .copyWith(color: AppTheme.blackColor),
                          ),
                          SizedBox(height: LayoutSpacing.heightSix),
                          Obx(
                                () => CustomTextField(
                                  controller: confirmPasswordController,
                                  hintText: 'Confirm new password',
                                  isObscure: authController.obscureNewPassword.value,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      authController.obscureConfirmNewPassword.value
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: AppTheme.greyColor,
                                      size: 16,
                                    ),
                                    onPressed: authController.toggleConfirmNewPasswordVisibility,
                                  ),
                                  validator: (value) => CustomValidator.confirmPassword(
                                    value,
                                    newPasswordController.text,
                                  ),
                                ),
                          ),
                          SizedBox(height: 8.h,),
                          CustomButton(
                            Text: 'Update Password',
                            onTap: () {
                              print("New Password : ${newPasswordController.text}");
                              print("Confirm Password : ${confirmPasswordController.text}");
                            },
                          ),
                          SizedBox(height: 24)
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
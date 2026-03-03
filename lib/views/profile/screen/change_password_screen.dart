import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetap/routes/app_routes.dart';
import 'package:onetap/views/profile/controller/profile_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../AppTheme/app_theme.dart';
import '../../../app_widgets/custom_app_header.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../app_widgets/custom_textfield.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_validator.dart';
import '../../../constants/layout_spacing.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final  changePasswordFormKey= GlobalKey<FormState>();

  ProfileController profileController = Get.find();

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
              title: 'Change Password',
              onBackPressed: () {Get.back();},
              onUploadPressed: () {},
              showUpload: false,
            ),
            SizedBox(height: LayoutSpacing.heighttwelve,),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: LayoutSpacing.heighttwelve,),
                  child: Form(
                    key: changePasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Old Password",style: AppTextStyle.font14Weight400TextStyle.copyWith(color: AppTheme.blackColor)),
                        SizedBox(height: LayoutSpacing.heightSix,),
                        Obx(
                              () => CustomTextField(
                            controller: profileController.oldPassController,
                            hintText: 'Enter new password',
                            isObscure: profileController.obscureOldPassword.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                profileController.obscureOldPassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppTheme.greyColor,
                                size: 16,
                              ),
                              onPressed:
                              profileController.toggleOldPasswordVisibility,
                            ),
                            validator: CustomValidator.oldPassword,
                          ),
                        ),

                        SizedBox(height: LayoutSpacing.heighttwelve,),

                        Text("New Password",style: AppTextStyle.font14Weight400TextStyle.copyWith(color: AppTheme.blackColor)),
                        SizedBox(height: LayoutSpacing.heightSix,),
                        Obx(
                              () => CustomTextField(
                            controller: profileController.newPassController,
                            hintText: 'Enter new password',
                            isObscure: profileController.obscureNewPass.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                profileController.obscureNewPass.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppTheme.greyColor,
                                size: 16,
                              ),
                              onPressed:
                              profileController.toggleConfirmPassVisibility,
                            ),
                            validator: CustomValidator.newPassword,
                          ),
                        ),

                        SizedBox(height: LayoutSpacing.heighttwelve,),

                        Text("Confirm New Password",style: AppTextStyle.font14Weight400TextStyle.copyWith(color: AppTheme.blackColor)),
                        SizedBox(height: LayoutSpacing.heightSix,),
                        Obx(
                              () => CustomTextField(
                            controller: profileController.confirmPassController,
                            hintText: 'Confirm New Password',
                            isObscure: profileController.obscureConfirmNewPass.value,
                            validator: (value) => CustomValidator.confirmPassword(
                              value,
                              profileController.newPassController.text,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                profileController.obscureConfirmNewPass.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppTheme.greyColor,
                                size: 16,
                              ),
                              onPressed:
                              profileController.toggleConfirmNewPassVisibility,
                            ),
                          ),
                        ),


                        SizedBox(height: 8.h,),
                        CustomButton(
                          Text: 'Update Password',
                          onTap: () {
                            if(changePasswordFormKey.currentState!.validate()){
                              print("Old Password : ${profileController.oldPassController.text}");
                              print("New Password : ${profileController.newPassController.text}");
                              print("Confirm Password : ${profileController.confirmPassController.text}");
                              Get.toNamed(AppRoutes.profileScreen);
                            }
                          },
                        ),
                        SizedBox(height: LayoutSpacing.heightTwenty_Four),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

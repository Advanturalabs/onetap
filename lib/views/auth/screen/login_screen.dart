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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.find();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Container(
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
                padding:  EdgeInsets.only(top: 40.h,left:LayoutSpacing.heightSixteen,right: LayoutSpacing.heightSixteen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: AppTextStyle.font24Weight700TextStyle
                          .copyWith(color: AppTheme.primaryColor),
                    ),
                    SizedBox(height: LayoutSpacing.heightEight),
                    Text(
                      'Welcome back to your account. Log in to manage your dashboard',
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
                          controller: emailController,
                          hintText: 'Enter your email',
                          validator: CustomValidator.email,
                        ),

                        SizedBox(height: LayoutSpacing.heighttwelve),

                        // Password
                        Text(
                          'Password',
                          style: AppTextStyle.font20Weight500TextStyle
                              .copyWith(color: AppTheme.blackColor),
                        ),
                        SizedBox(height: LayoutSpacing.heightSix),
                        Obx(
                              () => CustomTextField(
                            controller: passwordController,
                            hintText: 'Enter your password',
                            isObscure:
                            authController.obscureLoginPassword.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                authController.obscureLoginPassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppTheme.greyColor,
                                size: 16,
                              ),
                              onPressed:
                              authController.toggleLoginPasswordVisibility,
                            ),
                            validator: CustomValidator.password,
                          ),
                        ),
                        SizedBox(height: LayoutSpacing.heighttwelve),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.forgotPasswordScreen);
                            },
                            child: Text(
                              'Forgot password?',
                              style: AppTextStyle.font14Weight400TextStyle
                                  .copyWith(color: AppTheme.secondaryColor),
                            ),
                          ),
                        ),
                        SizedBox(height: LayoutSpacing.heightSixteen+LayoutSpacing.heightFour),
                        CustomButton(
                          Text: 'Log In',
                          onTap: () {
                            print("Email : ${emailController.text}");
                            print("Password : ${passwordController.text}");
                            Get.toNamed(AppRoutes.bottomNavScreen);
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
    );
  }
}
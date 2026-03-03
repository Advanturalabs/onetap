import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();


  final obscureOldPassword = true.obs;
  final obscureNewPass = true.obs;
  final obscureConfirmNewPass = true.obs;

  // Toggle password visibility for Login
  void toggleOldPasswordVisibility() {
    obscureOldPassword.value = !obscureOldPassword.value;
  }

  // Toggle password visibility for Login
  void toggleConfirmPassVisibility() {
    obscureNewPass.value = !obscureNewPass.value;
  }

  void toggleConfirmNewPassVisibility() {
    obscureConfirmNewPass.value = !obscureConfirmNewPass.value;
  }

}
import 'package:get/get.dart';

class AuthController extends GetxController {




  final obscureLoginPassword = true.obs;
  final obscureNewPassword = true.obs;
  final obscureConfirmNewPassword = true.obs;


  // Toggle password visibility for Login
  void toggleLoginPasswordVisibility() {
    obscureLoginPassword.value = !obscureLoginPassword.value;
  }
  // Toggle password visibility for Login
  void toggleNewPasswordVisibility() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  // Toggle password visibility for Login
  void toggleConfirmNewPasswordVisibility() {
    obscureConfirmNewPassword.value = !obscureConfirmNewPassword.value;
  }

}
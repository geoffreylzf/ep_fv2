import 'package:ep_fv2/controllers/utils/user_credential.dart';
import 'package:ep_fv2/utils/xanx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final isPasswordObscure = true.obs;

  final tecUsername = TextEditingController();
  final tecPassword = TextEditingController();

  @override
  Future<void> onClose() async {
    tecUsername.dispose();
    tecPassword.dispose();
  }

  toggleObscure() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  Future<void> login() async {
    try {
      XanX.showLoadingDialog();
      await Get.find<UserCredentialController>()
          .retrieveToken(un: tecUsername.text, pw: tecPassword.text);
      await Get.find<UserCredentialController>().retrieveUserInfo();
      XanX.dismissLoadingDialog();
      Get.offAllNamed("/");
    } catch (e) {
      XanX.dismissLoadingDialog();
      XanX.handleErrorMessage(e);
    }
  }
}

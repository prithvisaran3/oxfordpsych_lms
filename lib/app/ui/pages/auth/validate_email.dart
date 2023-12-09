import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/common/common_button.dart';
import '../../widgets/common/common_textform_field.dart';
import '../../widgets/common/logo_loading.dart';

class EmailValidateForForgotPasswordScreen extends StatelessWidget {
  const EmailValidateForForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Validate Email",
        isBackIcon: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextFormField(
              hintText: "Email",
              controller: AuthController.to.vEmail,
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return "Valid Email field required";
                }
                return null;
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: Obx(
              () => AuthController.to.updatePasswordLoading == true
                  ? LogoLoading()
                  : CommonButton(
                      text: "Confirm",
                      onPressed: () {
                        AuthController.to.validateEmailForForgotPassword();

                        // AuthController.to.checkPasswordChange();
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

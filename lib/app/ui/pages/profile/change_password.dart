import 'package:deviraj_lms/app/ui/widgets/common/appbar.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_button.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_textform_field.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Change Password",
        isBackIcon: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextFormField(
              hintText: "Current Password",
              controller: AuthController.to.currentPassword,
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return "Email field required";
                }
                return null;
              }),
          CommonTextFormField(
              hintText: "New password",
              obscureText: true,
              controller: AuthController.to.newPassword,
              validator: (data) {
                if (data!.isEmpty || data == "") {
                  return "Password field required";
                } else if (data.length < 6) {
                  return "Password at least 6 character";
                }
                return null;
              }),
          CommonTextFormField(
            hintText: "Confirm password",
            // obscureText: true,
            controller: AuthController.to.newConfirmPassword,
            validator: (data) {
              if (data!.isEmpty || data == "") {
                return "Password field required";
              } else if (data.length < 6) {
                return "Password at least 6 character";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: CommonButton(
              text: "Confirm",
              onPressed: () {
                AuthController.to.checkPasswordChange();
              },
            ),
          ),
        ],
      ),
    );
  }
}

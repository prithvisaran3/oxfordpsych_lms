import 'package:deviraj_lms/app/ui/pages/profile/profile.dart';
import 'package:deviraj_lms/app/ui/widgets/common/appbar.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_button.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_snackbar.dart';
import 'package:deviraj_lms/app/ui/widgets/common/common_textform_field.dart';
import 'package:deviraj_lms/app/ui/widgets/common/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(isBackIcon: true, title: 'Delete Account'),
      body: Obx(() => ProfileController.to.isDeleteAccount == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CommonText(
                  text: "Enter your email to delete account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                CommonTextFormField(
                  hintText: "Email",
                  controller: ProfileController.to.deleteEmail,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Email field required";
                    }
                    return null;
                  },
                ),
                CommonButton(
                  text: "Confirm",
                  onPressed: () {
                    ProfileController.to.deleteEmail.text == email
                        ? ProfileController.to.isDeleteAccount = true
                        : commonSnackBar(
                            title: "Wrong email",
                            msg: "Enter correct email to delete account");
                  },
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CommonText(
                  text: "Are you sure you want to delete your account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                CommonButton(
                  text: "Yes",
                  onPressed: () {
                    ProfileController.to.deleteAccount();
                  },
                ),
              ],
            )),
    );
  }
}

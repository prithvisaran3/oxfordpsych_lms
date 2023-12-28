import 'package:deviraj_lms/app/ui/widgets/common/common_button.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth.dart';
import '../../../controller/profile.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/common/common_textform_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        isBackIcon: true,
        centerTitle: false,
        title: "Edit Profile",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: AuthController.to.updateKey,
            child: Column(
              children: [
                CommonTextFormField(
                  hintText: "${ProfileController.to.profileDetails.name}",
                  controller: AuthController.to.name,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Name field required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                CommonTextFormField(
                  hintText: "${ProfileController.to.profileDetails.mobile}",
                  controller: AuthController.to.mobile,
                  validator: (data) {
                    if (data!.isEmpty || data == "") {
                      return "Mobile field required";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CommonButton(
                text: "Confirm",
                onPressed: () {
                  if (AuthController.to.updateKey.currentState!.validate()) {
                    ProfileController.to.updateProfile();
                  }
                }),
          )
        ],
      ),
    );
  }
}

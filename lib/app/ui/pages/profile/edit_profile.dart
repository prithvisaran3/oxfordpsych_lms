import 'package:deviraj_lms/app/ui/widgets/common/common_button.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth.dart';
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
      body: Form(
          // key: AuthController.to.registerKey,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextFormField(
            hintText: "Name   ${AuthController.to.name.text}",
            controller: AuthController.to.name,
            validator: (data) {
              if (data!.isEmpty || data == "") {
                return "Name field required";
              }
              return null;
            },
          ),
          CommonTextFormField(
            hintText: "Email   ${AuthController.to.email.text}",
            controller: AuthController.to.email,
            validator: (data) {
              if (data!.isEmpty || data == "") {
                return "Email field required";
              }
              return null;
            },
          ),
          CommonButton(text: "Confirm", onPressed: () {})
        ],
      )),
    );
  }
}

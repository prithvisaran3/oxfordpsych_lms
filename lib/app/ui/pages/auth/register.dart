import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth.dart';
import '../../theme/colors.dart';
import '../../theme/font_size.dart';
import '../../widgets/common/common_button.dart';
import '../../widgets/common/common_snackbar.dart';
import '../../widgets/common/common_textform_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                  ),
                  child: const Icon(
                    Icons.people,
                    size: 35,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Create an Account',
                  textAlign: TextAlign.center,
                  style: headText(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    // key: AuthController.to.registerKey,
                    child: Column(
                  children: [
                    CommonTextFormField(
                      hintText: "Enter your name",
                      controller: AuthController.to.name,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Name field required";
                        }
                        return null;
                      },
                    ),
                    CommonTextFormField(
                      hintText: "Enter your number",
                      controller: AuthController.to.mobile,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Name field required";
                        }
                        return null;
                      },
                    ),
                    CommonTextFormField(
                        hintText: "Enter your email",
                        controller: AuthController.to.email,
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "Email field required";
                          }
                          return null;
                        }),
                    CommonTextFormField(
                        hintText: "Enter your password",
                        obscureText: true,
                        controller: AuthController.to.password,
                        validator: (data) {
                          if (data!.isEmpty || data == "") {
                            return "Password field required";
                          } else if (data.length < 6) {
                            return "Password at least 6 character";
                          }
                          return null;
                        }),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Obx(
                      () => Checkbox(
                        activeColor: AppColors.primary,
                        value: AuthController.to.termsAndConditions,
                        onChanged: (value) {
                          AuthController.to.termsAndConditions = value;
                        },
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'I hereby agree to the ',
                        style: const TextStyle(
                            fontFamily: 'regular', color: AppColors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms of service \n and Privacy Policy',
                            style: const TextStyle(
                              fontFamily: 'medium',
                              color: AppColors.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (context) => new signIn()));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CommonButton(
                  text: "Create Account",
                  onPressed: () {
                    if (AuthController.to.termsAndConditions == false) {
                      commonSnackBar(
                          title: "Terms and Condition",
                          msg: "Please agree to the terms to continue");
                    } else {
                      AuthController.to.register(isGoogleLogin: false);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: const TextStyle(
                        fontFamily: 'regular', color: AppColors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Log In',
                        style: const TextStyle(
                          fontFamily: 'medium',
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

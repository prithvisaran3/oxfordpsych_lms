import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth.dart';
import '../../theme/colors.dart';
import '../../theme/font_size.dart';
import '../../widgets/common/common_button.dart';
import '../../widgets/common/common_textform_field.dart';
import '../../widgets/common/loading.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                Padding(
                  padding: AuthController.to.registerLoading == true
                      ? const EdgeInsets.symmetric(
                          vertical: 150, horizontal: 10)
                      : const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          width: Get.width * 0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: Colors.grey.shade300),
                          ),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.fitHeight,
                          )),

                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          key: AuthController.to.registerKey,
                          child: Column(
                            children: [
                              CommonTextFormField(
                                  hintText: "Enter your email",
                                  controller: AuthController.to.lEmail,
                                  validator: (data) {
                                    if (data!.isEmpty || data == "") {
                                      return "Email field required";
                                    }
                                    return null;
                                  }),
                              CommonTextFormField(
                                hintText: "Enter your password",
                                obscureText: true,
                                controller: AuthController.to.lPassword,
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return "Password field required";
                                  } else if (data.length < 3) {
                                    return "Password at least 6 character";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     InkWell(
                      //       onTap: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => forgotPassword()));
                      //       },
                      //       child: const Text(
                      //         'Forgot Password ?',
                      //         style: TextStyle(color: AppColors.primary),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => AuthController.to.loginLoading == true
                            ? const SimpleLoading()
                            : CommonButton(
                                text: "Login",
                                onPressed: () {
                                  if (AuthController
                                      .to.registerKey.currentState!
                                      .validate()) {
                                    AuthController.to.login();
                                  }
                                }),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // const Text('Or'),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Platform.isAndroid
                      //         ? GestureDetector(
                      //             onTap: () {
                      //               AuthController.to
                      //                   .googleSignIn(context: context);
                      //             },
                      //             child: Image.asset(
                      //               'assets/images/google.png',
                      //               height: 25,
                      //               width: 25,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           )
                      //         : const SizedBox(),
                      //     const SizedBox(
                      //       width: 25,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {
                      //         AuthController.to.appleLogin();
                      //       },
                      //       child: Image.asset(
                      //         'assets/images/apple.png',
                      //         height: 30,
                      //         width: 30,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style: const TextStyle(
                              fontFamily: 'regular', color: AppColors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Register',
                              style: const TextStyle(
                                fontFamily: 'medium',
                                color: AppColors.primary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const Register());
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => AuthController.to.registerLoading == true
                    ? Container(
                        alignment: Alignment.center,
                        height: Get.height,
                        width: Get.width,
                        decoration: const BoxDecoration(color: Colors.black26),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Please wait...",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeCap: StrokeCap.round,
                              strokeWidth: 6,
                            )
                          ],
                        ),
                      )
                    : const SizedBox())
              ],
            ),
          ),
        ));
  }
}

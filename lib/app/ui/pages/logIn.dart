import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages/forgotPassword.dart';
import 'home/main.dart';
import 'register.dart';
import '../../controller/auth.dart';
import '../theme/colors.dart';
import '../theme/font.dart';
import '../widgets/common/common_button.dart';
import '../widgets/common/common_textform_field.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
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
                      Icons.lock,
                      size: 35,
                      color: AppColors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: headText(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'A handful of model sentence structures',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextFormField(
                      hintText: "Enter your email",
                      controller: AuthController.to.lEmail,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Email field required";
                        }
                        return null;
                      }),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: CommonTextFormField(
                            hintText: "Enter your password",
                            obscureText: true,
                            controller: AuthController.to.lPassword,
                            validator: (data) {
                              if (data!.isEmpty || data == "") {
                                return "Password field required";
                              } else if (data.length < 6) {
                                return "Password at least 6 character";
                              }
                              return null;
                            }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1, color: Colors.grey.shade300),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: const Icon(Icons.fingerprint),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgotPassword()));
                        },
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonButton(
                      text: "Login",
                      onPressed: () {
                        Get.to(() => HomeMain());
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Or'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                        'assets/images/google.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
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
                              Get.to(() => Register());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

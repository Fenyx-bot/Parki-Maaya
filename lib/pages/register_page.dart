// ignore: file_names
import "package:parki/components/custom_button.dart";
import "package:parki/components/custom_textfield.dart";
import "package:flutter/material.dart";
import "package:parki/constants/constants.dart";
import "package:parki/functions/toast_snack_bar.dart";
import "package:parki/services/auth/auth_manager.dart";
import "package:parki/utils/email_checker.dart";

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  final AuthManager _authManager = AuthManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  //logo
                  Icon(
                    Icons.message,
                    size: 100,
                    color: iconColor,
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // welcome back text
                  const Text(
                    "Let's get you started!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //email textfield
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //password textfield
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //password textfield
                  CustomTextField(
                    controller: repeatPasswordController,
                    hintText: 'Repeat Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  CustomButton(
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          repeatPasswordController.text.isEmpty) {
                        ToastBar(context, "Please fill all the fields");
                        return;
                      }

                      if (isEmailValid(emailController.text) == false) {
                        ToastBar(context, "Invalid email address");
                        return;
                      }

                      if (passwordController.text !=
                          repeatPasswordController.text) {
                        ToastBar(context, "Passwords do not match");
                        return;
                      }

                      _authManager.signUp(
                        context,
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    text: 'Sign Up',
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //become a member button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member?',
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login Now!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

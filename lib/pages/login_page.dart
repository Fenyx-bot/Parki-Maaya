import "package:flutter/material.dart";
import "package:parki/components/custom_button.dart";
import "package:parki/components/custom_textfield.dart";
import "package:parki/functions/toast_snack_bar.dart";
import "package:parki/services/auth/auth_manager.dart";

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthManager _authManager = AuthManager();

  //Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                    Icons.car_rental,
                    size: 100,
                    color: Colors.grey[800],
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // welcome back text
                  const Text(
                    "Welcome Back, Ready to park again?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                    obscureText: showPassword,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: !showPassword,
                        onChanged: (value) {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      const Text("Show Password"),
                    ],
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  //sign in button
                  CustomButton(
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ToastBar(context, 'Please fill all the fields');
                        return;
                      }

                      _authManager.signInWithEmailAndPassword(
                        context,
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    text: 'Sign In',
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // become a member button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member yet?'),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: widget.onTap,
                        child: const Text(
                          'Sign Up Now!',
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

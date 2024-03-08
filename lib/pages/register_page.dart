// ignore: file_names
import "package:parki/components/custom_button.dart";
import "package:parki/components/custom_textfield.dart";
import "package:flutter/material.dart";

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  //sign up function
  void signUp() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const SizedBox(height: 50,),
      
                //logo
                Icon(Icons.message, size: 100,color: Theme.of(context).appBarTheme.iconTheme!.color,),
      
                const SizedBox(height: 50,),
                    
                // welcome back text
                const Text("Let's get you started!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      
                const SizedBox(height: 25,),

                //email textfield
                CustomTextField(controller: emailController, hintText: 'Email', obscureText: false),
      
                const SizedBox(height: 10,),
                    
                //password textfield
                CustomTextField(controller: passwordController, hintText: 'Password', obscureText: true),

                const SizedBox(height: 10,),
                    
                //password textfield
                CustomTextField(controller: repeatPasswordController, hintText: 'Repeat Password', obscureText: true),
      
                const SizedBox(height: 25,),
                    
                //sign in button
                CustomButton(onTap: signUp, text: 'Sign Up'),
      
                const SizedBox(height: 50,),
                    
                //become a member button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Already a member?', style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color),),
                  const SizedBox(width: 4,),
                  GestureDetector(onTap: widget.onTap ,child: Text('Login Now!', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).appBarTheme.titleTextStyle!.color),))
      
                ],)
      
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
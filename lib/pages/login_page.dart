import "package:firebase_auth/firebase_auth.dart";
import "package:parki/components/custom_button.dart";
import "package:parki/components/custom_textfield.dart";
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in function
  void signIn() async {

    //Show loading circle
    showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator(),));

    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        //pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password provided for that user.')));
      }
    }

    //pop loading circle
    // ignore: use_build_context_synchronously
    //Navigator.pop(context);
  }

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
                const SizedBox(height: 50,),
      
                //logo
                Icon(Icons.car_rental, size: 100,color: Colors.grey[800],),
      
                const SizedBox(height: 50,),
                    
                // welcome back text
                const Text("Welcome Back, Ready to park again?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      
                const SizedBox(height: 25,),
                    
                //email textfield
                CustomTextField(controller: emailController, hintText: 'Email', obscureText: false),
      
                const SizedBox(height: 10,),
                    
                //password textfield
                CustomTextField(controller: passwordController, hintText: 'Password', obscureText: true),
      
                const SizedBox(height: 25,),
                    
                //sign in button
                CustomButton(onTap: signIn, text: 'Sign In'),
      
                const SizedBox(height: 50,),
                    
                //become a member button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text('Not a member yet?'),
                  const SizedBox(width: 4,),
                  GestureDetector(onTap: widget.onTap ,child: const Text('Sign Up Now!', style: TextStyle(fontWeight: FontWeight.bold),))
      
                ],)
      
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
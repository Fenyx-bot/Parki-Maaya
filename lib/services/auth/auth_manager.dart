import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:parki/functions/toast_snack_bar.dart';

class AuthManager {
  //sign in function
  void signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    //Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Dismiss loading circle after successful login
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        ToastBar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        //pop loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        ToastBar(context, "Wrong password provided for that user.");
      }
    }

    //pop loading circle
    // ignore: use_build_context_synchronously
    //Navigator.pop(context);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void signUp(BuildContext context, String email, String password) {
    //Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}

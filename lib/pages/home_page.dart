import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parki/components/custom_drawer.dart';
import 'package:parki/services/auth/auth_manager.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final AuthManager _authManager = AuthManager();

  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _authManager.signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Logged in as: ${user.email!}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

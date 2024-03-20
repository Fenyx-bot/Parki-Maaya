import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  "Parki",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Logged in as: ${user.email}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushNamed("/");
            },
          ),
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              Navigator.of(context).pushNamed("/profile");
            },
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.of(context).pushNamed("/settings");
            },
          ),
        ],
      ),
    );
  }
}

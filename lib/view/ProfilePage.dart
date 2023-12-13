import 'package:chat_app/controller/authController.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              AuthController.instance.signOut();
            },
            child: Text("Logout")),
      ),
    );
  }
}

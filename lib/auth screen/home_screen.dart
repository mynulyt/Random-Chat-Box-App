import 'package:chat_app/Widget/Button.dart';
import 'package:chat_app/auth%20screen/login_screen.dart';
import 'package:chat_app/auth%20service/authentication.dart';
import 'package:flutter/material.dart';
//Home page provid

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              "Congratulation\nYou have successfulley Login!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            OurButton(
                onTab: () async {
                  await AuthServices().signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                text: "Log Out")
          ],
        ),
      ),
    );
  }
}

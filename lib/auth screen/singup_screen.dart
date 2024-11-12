import 'package:chat_app/Widget/Button.dart';
import 'package:chat_app/Widget/show_snak_bar.dart';
import 'package:chat_app/Widget/text_editing_field.dart';
import 'package:chat_app/auth%20Screen/login_screen.dart';
import 'package:chat_app/auth%20screen/home_screen.dart';
import 'package:chat_app/auth%20service/authentication.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool isLoading = false;
  @override
  void despose() {
    super.dispose();
    emailController.dispose();
    PasswordController.dispose();
    nameController.dispose();
  }

  void signUpUser() async {
    String res = await AuthServices().signUpUser(
        email: emailController.text,
        password: PasswordController.text,
        name: nameController.text);
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.8,
                child: Image.asset("images/signup.jpeg"),
              ),
              TextFieldInput(
                textEditingController: nameController,
                hinText: "Enter your Name",
                icon: Icons.person,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFieldInput(
                textEditingController: emailController,
                hinText: "Enter your Emai",
                icon: Icons.email,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFieldInput(
                isPass: true,
                textEditingController: PasswordController,
                hinText: "Enter your Password",
                icon: Icons.lock,
              ),
              OurButton(onTab: signUpUser, text: "Sign Up"),
              SizedBox(
                height: height / 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

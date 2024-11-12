import 'package:chat_app/Chat/chat_page.dart';
import 'package:chat_app/Widget/Button.dart';
import 'package:chat_app/Widget/show_snak_bar.dart';
import 'package:chat_app/Widget/text_editing_field.dart';
import 'package:chat_app/auth%20screen/singup_screen.dart';
import 'package:chat_app/auth%20service/authentication.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  @override
  void despose() {
    super.dispose();
    emailController.dispose();
    PasswordController.dispose();
  }

  void loginUser() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: PasswordController.text,
    );
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChatPage(name: nameController.text),
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
                height: height / 2.7,
                child: Image.asset("images/login.jpg"),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFieldInput(
                textEditingController: nameController,
                hinText: "Enter your Name",
                icon: Icons.person,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              OurButton(onTab: loginUser, text: "Log In"),
              SizedBox(
                height: height / 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
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
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "Sigin Up",
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

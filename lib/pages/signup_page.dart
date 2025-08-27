// ignore_for_file: use_build_context_synchronously

import 'package:book_hotel/hotel%20_owner/hotel_detail.dart';
import 'package:book_hotel/pages/bottom_nav.dart';
import 'package:book_hotel/pages/home_page.dart';
import 'package:book_hotel/pages/login_page.dart';
import 'package:book_hotel/services/database_helper.dart';
import 'package:book_hotel/services/shared_prefs.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class SignupPage extends StatefulWidget {
  String redirect;

  SignupPage({super.key, required this.redirect});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? name, email, password;
  String imageUrl = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  registration() async {
    if (password != null && email != null && name != null) {
      try {
        // ignore: unused_local_variable
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);

        String id = randomAlphaNumeric(10);

        await SharedPrefHelper().saveUserId(id);
        await SharedPrefHelper().saveUsername(nameController.text);
        await SharedPrefHelper().saveUserEmail(emailController.text);
        await SharedPrefHelper().saveUserImage(imageUrl);

        Map<String, dynamic> userInfo = {
          'name': name,
          'email': email,
          'id': id,
          'image': imageUrl,
          'role': widget.redirect == 'Owner' ? 'Owner' : 'User',
        };

        await DatabaseMethods().addUser(userInfo, id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Registered Successfully'),
          ),
        );
        widget.redirect == 'Owner'
            ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HotelDetail()),
            )
            : Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
            );
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'weak-password':
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text('Passwotd is too weak'),
              ),
            );
            break;
          case 'email-already-in-use':
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Account already exists')));
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(e.code),
              ),
            );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'images/signup.png',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Text(
                  'Sign Up',
                  style: AppWidget.headLineTextStyle(25.0),
                ),
              ),
              const SizedBox(height: 5.0),
              Center(
                child: Text(
                  'Please enter your details to continue',
                  style: AppWidget.normalTextStyle(17.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('Name', style: AppWidget.headLineTextStyle(18.0)),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 1, 52, 94),
                    ),
                    border: InputBorder.none,
                    hintText: "Please enter your name",
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('Email', style: AppWidget.headLineTextStyle(18.0)),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: const Color.fromARGB(255, 1, 52, 94),
                    ),
                    border: InputBorder.none,
                    hintText: "Please enter your email",
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Password',
                  style: AppWidget.headLineTextStyle(18.0),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: const Color.fromARGB(255, 1, 52, 94),
                    ),
                    border: InputBorder.none,
                    hintText: "Please enter your password",
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (nameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        emailController.text.isNotEmpty) {
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                        name = nameController.text;
                      });
                      registration();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: AppWidget.whiteTextStyle(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppWidget.normalTextStyle(18.0),
                  ),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => LoginPage(redirect: widget.redirect),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: AppWidget.headLineTextStyle(18.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

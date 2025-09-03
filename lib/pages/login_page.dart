import 'package:book_hotel/hotel%20_owner/hotelowner_home.dart';
import 'package:book_hotel/pages/bottom_nav.dart';
import 'package:book_hotel/pages/signup_page.dart';
import 'package:book_hotel/services/database_helper.dart';
import 'package:book_hotel/services/shared_prefs.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  String redirect;
  LoginPage({super.key, required this.redirect});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password, name, id, role;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      final snapshot = await DatabaseMethods().getUserByEmail(email!);
      name = snapshot.docs[0]['name'];
      id = snapshot.docs[0]['id'];  //still the same random id we generated and sent to the backend
      role = snapshot.docs[0]['role'];

       await SharedPrefHelper().saveUserId(id!); //resaving the same id
        await SharedPrefHelper().saveUsername(name!);
        await SharedPrefHelper().saveUserEmail(email!);

     role == 'owner' ?  Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) {
            return HotelownerHome();
          },
        ),
      ) :  Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) {
            return BottomNavBar();
          },
        ),
      ) ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('No user found for that email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong password provided by user')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.code)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/login.png', fit: BoxFit.cover),
              Center(
                child: Text('Login', style: AppWidget.headLineTextStyle(25.0)),
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
              const SizedBox(height: 20.0),
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
              const SizedBox(height: 15.0),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    /*  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      ); */
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      'Forgot Password?',
                      style: AppWidget.normalTextStyle(18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (passwordController.text.isNotEmpty &&
                        emailController.text.isNotEmpty) {
                      setState(() {
                        email = emailController.text;
                        password = passwordController.text;
                      });
                      userLogin();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 5, 125, 223),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
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
                    'Don\'t have an account?',
                    style: AppWidget.normalTextStyle(18.0),
                  ),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  SignupPage(redirect: widget.redirect),
                        ),
                      );
                    },
                    child: Text(
                      'Signup',
                      style: AppWidget.headLineTextStyle(18.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

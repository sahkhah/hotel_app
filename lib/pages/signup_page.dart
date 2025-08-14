import 'package:book_hotel/pages/login_page.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                child: Text('Sign Up', style: AppWidget.headLineTextStyle(25.0)),
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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 1, 52, 94)),
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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: const Color.fromARGB(255, 1, 52, 94)),
                    border: InputBorder.none,
                    hintText: "Please enter your email",
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('Password', style: AppWidget.headLineTextStyle(18.0)),
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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password, color: const Color.fromARGB(255, 1, 52, 94)),
                    border: InputBorder.none,
                    hintText: "Please enter your password",
                  ),
                ),
              ),
               const SizedBox(height: 20.0),
              Center(
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50.0,
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20.0)),
                    child: Center(child: Text('Sign Up', style: AppWidget.whiteTextStyle(20.0),)),
                  
                  ),
                ),
              ),
              const SizedBox(height: 10.0,),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text('Already have an account?', style: AppWidget.normalTextStyle(18.0),),
                const SizedBox(width: 5.0,),
                GestureDetector(
                  onTap: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                  },
                  child: Text('Login', style: AppWidget.headLineTextStyle(18.0),)),
              ],),
              const SizedBox(height: 50.0,)
,              
            ],
          ),
        ),
      ),
    );
  }
}

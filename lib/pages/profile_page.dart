import 'package:book_hotel/onboarding.dart';
import 'package:book_hotel/pages/signup_page.dart';
import 'package:book_hotel/services/auth.dart';
import 'package:book_hotel/services/shared_prefs.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name, email;

  getOnTheLoad() async {
    name = await SharedPrefHelper().getUserName() ?? 'User';
    email = await SharedPrefHelper().getUserEmail() ?? 'user@example.com';
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PROFILE', style: AppWidget.headLineTextStyle(20.0)),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.asset(
                  'images/boy.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      size: 30.0,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name', style: AppWidget.normalTextStyle(17.0)),
                        Text(name!, style: AppWidget.headLineTextStyle(20.0)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail_outline,
                      size: 30.0,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: AppWidget.normalTextStyle(17.0)),
                        Text(email!, style: AppWidget.headLineTextStyle(20.0)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            GestureDetector(
              onTap: () => Auth().signOut().then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardingPage();
                        },
                      ),
                    );
                  }),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 30.0,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Text(
                          'LogOut',
                          style: AppWidget.headLineTextStyle(20.0),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 25.0,
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            GestureDetector(
              onTap:
                  () => Auth().deleteUser().then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardingPage();
                        },
                      ),
                    );
                  }),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        size: 30.0,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Text(
                          'Delete',
                          style: AppWidget.headLineTextStyle(20.0),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 25.0,
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

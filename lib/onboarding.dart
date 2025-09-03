import 'package:book_hotel/pages/signup_page.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool isHotelOwner = false;
  bool isGuest = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('images/bg.png', fit: BoxFit.cover),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Text(
                  'Please select your role to get started:',
                  style: AppWidget.headLineTextStyle(22.0),
                ),
                const SizedBox(height: 40.0),
                isHotelOwner
                    ? Material(
                      elevation: 6.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: Color(0xff67cbfb),
                                ),
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: Image.asset(
                                'images/hotel.png',
                                height: 45.0,
                                width: 45.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Looking for guests?',
                                  style: AppWidget.headLineTextStyle(18.0),
                                ),
                                Text(
                                  'Easily find guests for your hotel.',
                                  style: AppWidget.normalTextStyle(12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () {
                        isHotelOwner = !isHotelOwner;
                        isGuest = false;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: Color(0xff67cbfb),
                                ),
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: Image.asset(
                                'images/hotel.png',
                                height: 45.0,
                                width: 45.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Looking for guests?',
                                  style: AppWidget.headLineTextStyle(18.0),
                                ),
                                Text(
                                  'Easily find guests for your hotel.',
                                  style: AppWidget.normalTextStyle(12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                const SizedBox(height: 40.0),
                isGuest
                    ? Material(
                      elevation: 6.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: Color(0xff67cbfb),
                                ),
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: Image.asset(
                                'images/user.png',
                                height: 45.0,
                                width: 45.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Looking for hotels?',
                                  style: AppWidget.headLineTextStyle(18.0),
                                ),
                                Text(
                                  'Join our platform to find and book \nthe best hotels.',
                                  style: AppWidget.normalTextStyle(12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : GestureDetector(
                      onTap: () {
                        isHotelOwner = false;
                        isGuest = !isGuest;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: Color(0xff67cbfb),
                                ),
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: Image.asset(
                                'images/user.png',
                                height: 45.0,
                                width: 45.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Looking for hotels?',
                                  style: AppWidget.headLineTextStyle(18.0),
                                ),
                                Text(
                                  'Join our platform to find and book \nthe best hotels.',
                                  style: AppWidget.normalTextStyle(12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return SignupPage(redirect: isHotelOwner ? 'Owner' : 'User',);
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: const Color.fromARGB(255, 44, 2, 107),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

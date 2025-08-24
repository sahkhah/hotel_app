import 'package:book_hotel/hotel%20_owner/hotel_detail.dart';
import 'package:book_hotel/pages/bottom_nav.dart';
import 'package:book_hotel/pages/detail_page.dart';
import 'package:book_hotel/pages/home_page.dart';
import 'package:book_hotel/pages/login_page.dart';
import 'package:book_hotel/pages/signup_page.dart';
import 'package:book_hotel/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = publishedKey;
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BottomNavBar(),
    );
  }
}

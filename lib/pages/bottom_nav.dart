import 'package:book_hotel/pages/booking_page.dart';
import 'package:book_hotel/pages/home_page.dart';
import 'package:book_hotel/pages/profile_page.dart';
import 'package:book_hotel/pages/wallet_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Widget> pages;
  late HomePage home;
  late BookingPage booking;
  late ProfilePage profile;
  late WalletPage wallet;

  int currentTabIndex = 0;

  @override
  void initState() {
    home = HomePage();
    booking = BookingPage();
    profile = ProfilePage();
    wallet = WalletPage();

    pages = [home, booking, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 200),
        color: Colors.black,
        height: 70.0,
        items: [
          Icon(Icons.home, color: Colors.white, size: 30.0),
          Icon(Icons.shopping_bag, color: Colors.white, size: 30.0),
          Icon(Icons.wallet, color: Colors.white, size: 30.0),
          Icon(Icons.person, color: Colors.white, size: 30.0),
        ],
        onTap: (index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
      body: pages[currentTabIndex],
    );
  }
}

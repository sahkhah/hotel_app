import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Text('Bookings', style: AppWidget.headLineTextStyle(30.0)),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
               decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xffececf8),
                        ),
            )
          ],
        )
      ),
    );
  }
}
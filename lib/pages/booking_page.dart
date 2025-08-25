import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool incoming = true;
  bool past = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bookings', style: AppWidget.headLineTextStyle(30.0)),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                incoming
                    ? Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 160,
                        //height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xffececf8),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/incoming.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Incoming \n Bookings',
                              style: AppWidget.headLineTextStyle(20.0),
                            ),
                          ],
                        ),
                      ),
                    )
                    : GestureDetector(
                       onTap: () {
                          incoming = true;
                          past = false;
                          setState(() {
                            
                          });
                        },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 160,
                        //height: 200,
                        decoration: BoxDecoration(color: Color(0xffececf8), 
                        borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/incoming.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10.0),
                            Center(
                              child: Text(
                                'Incoming \n Bookings',
                                style: AppWidget.headLineTextStyle(20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                const SizedBox(width: 20.0),
                past
                    ? Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 160,
                        //height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xffececf8),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/past.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Past \n Bookings',
                              style: AppWidget.headLineTextStyle(20.0),
                            ),
                          ],
                        ),
                      ),
                    )
                    : GestureDetector(
                       onTap: () {
                          past = true;
                          incoming = false;
                          setState(() {});
                        },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 160,
                        //height: 200,
                        decoration: BoxDecoration(color: Color(0xffececf8),
                        borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/past.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10.0),
                            Center(
                              child: Text(
                                'Past \n Bookings',
                                style: AppWidget.headLineTextStyle(20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

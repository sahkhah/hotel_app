import 'package:book_hotel/services/database_helper.dart';
import 'package:book_hotel/services/shared_prefs.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool incoming = true;
  bool past = false;

  Stream? bookingStream;
  String? id;

  getOnTheLoad() async {
    id = await SharedPrefHelper().getUserId();
    bookingStream = await DatabaseMethods().getUserBookings(id!);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allBookings() {
    return StreamBuilder(
      stream: bookingStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? SizedBox(
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Material(
                     elevation: 2.0,
                     borderRadius: BorderRadius.circular(10.0),
                     child: Container(
                       padding: EdgeInsets.all(5.0),
                       width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(
                         color: Color(0xffececf8),
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                       child: Row(
                         children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(30.0),
                             child: Image.asset(
                               'images/hotel1.jpg',
                               height: 100,
                               width: 100,
                               fit: BoxFit.cover,
                             ),
                           ),
                           const SizedBox(width: 10.0),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [
                                   Icon(
                                     Icons.hotel,
                                     color: Colors.blue,
                                     size: 25.0,
                                   ),
                                   const SizedBox(width: 10.0),
                                   Text(
                                     ds['hotelName'],
                                     style: AppWidget.headLineTextStyle(18.0),
                                   ),
                                 ],
                               ),
                               const SizedBox(height: 5.0),
                               Row(
                                 children: [
                                   Icon(
                                     Icons.calendar_month,
                                     color: Colors.blue,
                                     size: 25.0,
                                   ),
                                   const SizedBox(width: 5.0),
                                   SizedBox(
                                     width:
                                         MediaQuery.of(context).size.width / 3,
                                     child: Text(
                                       '${ds['checkIn']} to ${ds['checkOut']}',
                                       style: AppWidget.normalTextStyle(15.0),
                                     ),
                                   ),
                                 ],
                               ),
                               const SizedBox(height: 5.0),
                               Row(
                                 children: [
                                   Icon(
                                     Icons.group,
                                     color: Colors.blue,
                                     size: 30.0,
                                   ),
                                   const SizedBox(width: 7.0),
                                   Text(
                                     ds['noOfGuests'],
                                     style: AppWidget.headLineTextStyle(18.0),
                                   ),
                                   const SizedBox(width: 10.0),
                                   Icon(
                                     Icons.monetization_on,
                                     color: Colors.blue,
                                     size: 25.0,
                                   ),
                                   const SizedBox(width: 7.0),
                                   Text(
                                     ds['amount'],
                                     style: AppWidget.headLineTextStyle(18.0),
                                   ),
                                 ],
                               ),
                              
                             ],
                           ),
                         ],
                       ),
                     ),
                   );
                },
              ),
            )
            : Container();
      },
    );
  }

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
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xffececf8),
                          borderRadius: BorderRadius.circular(20.0),
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
                        decoration: BoxDecoration(
                          color: Color(0xffececf8),
                          borderRadius: BorderRadius.circular(20.0),
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
            const SizedBox(height: 20.0),
            allBookings(),
          ],
        ),
      ),
    );
  }
}

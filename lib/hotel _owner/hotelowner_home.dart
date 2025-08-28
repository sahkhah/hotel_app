import 'package:book_hotel/services/database_helper.dart';
import 'package:book_hotel/services/shared_prefs.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HotelownerHome extends StatefulWidget {
  const HotelownerHome({super.key});

  @override
  State<HotelownerHome> createState() => _HotelownerHomeState();
}

class _HotelownerHomeState extends State<HotelownerHome> {
  String? userId, name;
  Stream? hotelBookings;

  getOnTheShared() async {
    userId = await SharedPrefHelper().getUserId();
    name = await SharedPrefHelper().getUserName();
    hotelBookings = await DatabaseMethods().getHotelOwnerBookings(userId!);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheShared();
    super.initState();
  }

  @override
  Widget allAdminBookings() {
    return StreamBuilder(
      stream: hotelBookings,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? SizedBox(
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  final format = DateFormat('EEE dd, MM yyyy');
                  final date = format.parse(ds['checkIn']);
                  final now = DateTime.now();

                  return date.isBefore(now)
                      ? Material(
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
                                        style: AppWidget.headLineTextStyle(
                                          18.0,
                                        ),
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
                                            MediaQuery.of(context).size.width /
                                            3,
                                        child: Text(
                                          '${ds['checkIn']} to ${ds['checkOut']}',
                                          style: AppWidget.normalTextStyle(
                                            15.0,
                                          ),
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
                                        style: AppWidget.headLineTextStyle(
                                          18.0,
                                        ),
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
                                        style: AppWidget.headLineTextStyle(
                                          18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      : Container();
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
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/home.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(color: Color.fromARGB(83, 0, 0, 0)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/wave.png',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            'Hello Saka',
                            style: AppWidget.boldWhiteTextStyle(20.0),
                          ),
                        ],
                      ),
                      Text(
                        'ready to welcome \n your new guest?',
                        style: AppWidget.boldWhiteTextStyle(20.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4.5,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                     color: Color(0xffececf8),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20.0,),
                        Container(
                          height: MediaQuery.of(context).size.height/1.4,
                          child: allAdminBookings(),
                        )
                      ],
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

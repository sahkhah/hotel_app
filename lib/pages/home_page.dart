import 'package:book_hotel/pages/detail_page.dart';
import 'package:book_hotel/services/database_helper.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? hotelStream;

  getData() async {
    hotelStream = await DatabaseMethods().getHotel();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget allHotels() {
    return StreamBuilder(
      stream: hotelStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailPage(
                                name: ds['hotelName'],
                                price: ds['hotelCharges'],
                                wifi: ds['wi-fi'],
                                tv: ds['HD-TV'],
                                bathroom: ds['Bathroom'],
                                kitchen: ds['Kitchen'],
                                description: ds['hotelDescription'],
                              ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 3.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  'images/hotel1.jpg',
                                  fit: BoxFit.cover,
                                  height: 220.0,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      ds['hotelName'],
                                      style: AppWidget.headLineTextStyle(22.0),
                                    ),
                                    SizedBox(width: 30.0),
                                    Text(
                                      '\$${ds['hotelCharges']}',
                                      style: AppWidget.headLineTextStyle(22.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.blue,
                                      size: 30.0,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      ds['hotelAddress'],
                                      style: AppWidget.normalTextStyle(18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            : Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                elevation: 3.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'images/hotel1.jpg',
                          fit: BoxFit.cover,
                          height: 220.0,
                          width: MediaQuery.of(context).size.width / 1.2,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Hotel Beach',
                              style: AppWidget.headLineTextStyle(22.0),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4.0,
                            ),
                            Text(
                              '\$20',
                              style: AppWidget.headLineTextStyle(22.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              'Near Obasanjo Way, Abeokuta',
                              style: AppWidget.normalTextStyle(18.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    child: Image.asset(
                      'images/home.jpg',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      height: 230,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                      color: Colors.black45,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white),
                            const SizedBox(width: 10.0),
                            Text(
                              'Abeokuta, Ogun State',
                              style: AppWidget.whiteTextStyle(20.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Hey Kamil, Tell us where you want to go',
                          style: AppWidget.whiteTextStyle(20.0),
                        ),
                        const SizedBox(height: 30.0),
                        Container(
                          margin: const EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color.fromARGB(103, 255, 255, 255),
                          ),
                          width: double.infinity,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintText: 'Search Places..',
                              hintStyle: AppWidget.whiteTextStyle(20.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'The Most Relevant',
                  style: AppWidget.headLineTextStyle(22.0),
                ),
              ),
              const SizedBox(height: 15.0),
              allHotels(),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Discover new places',
                  style: AppWidget.headLineTextStyle(22.0),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 250.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  'images/mumbai.jpg',
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Mumbai',
                                  style: AppWidget.headLineTextStyle(20.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text(
                                      '10 Hotels',
                                      style: AppWidget.normalTextStyle(18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  'images/newyork.jpg',
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'New York',
                                  style: AppWidget.headLineTextStyle(20.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text(
                                      '8 Hotels',
                                      style: AppWidget.normalTextStyle(18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  'images/bali.jpg',
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Bali',
                                  style: AppWidget.headLineTextStyle(20.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text(
                                      '9 Hotels',
                                      style: AppWidget.normalTextStyle(18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  'images/newyork.jpg',
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Dubai',
                                  style: AppWidget.headLineTextStyle(20.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.hotel, color: Colors.blue),
                                    SizedBox(width: 5.0),
                                    Text(
                                      '7 Hotels',
                                      style: AppWidget.normalTextStyle(18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

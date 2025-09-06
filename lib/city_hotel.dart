import 'package:book_hotel/services/database_helper.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CityHotel extends StatefulWidget {
  String city;
  CityHotel({super.key, required this.city});

  @override
  State<CityHotel> createState() => _CityHotelState();
}

class _CityHotelState extends State<CityHotel> {
  Stream? cityStreams;

  getOnTheLoad() async {
    cityStreams = await DatabaseMethods().getUserCityHotel(widget.city);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allCities() {
    return StreamBuilder(
      stream: cityStreams,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                 return Container(
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.city, style: AppWidget.headLineTextStyle(22.0)),
      ),
      body: allCities(),
    );
  }
}

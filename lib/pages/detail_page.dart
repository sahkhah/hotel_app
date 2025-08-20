import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String price;
  final String wifi;
  final String tv;
  final String bathroom;
  final String kitchen;
  final String description;

  const DetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.wifi,
    required this.tv,
    required this.bathroom,
    required this.kitchen,
    required this.description,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50.0),
                      ),
                      child: Image.asset(
                        'images/hotel1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      margin: const EdgeInsets.only(top: 50.0, left: 20.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: AppWidget.headLineTextStyle(25.0),
                    ),
                    Text('\$${widget.price}', style: AppWidget.normalTextStyle(25.0)),
                    Divider(thickness: 2.0),
                    const SizedBox(height: 10.0),
                    Text(
                      'What this place offers',
                      style: AppWidget.headLineTextStyle(22.0),
                    ),
                    const SizedBox(height: 5.0),
                   widget.wifi == 'true' ?  Row(
                      children: [
                        Icon(Icons.wifi, color: Colors.blue, size: 30.0),
                        const SizedBox(width: 10.0),
                        Text('WIFI', style: AppWidget.normalTextStyle(22.0)),
                      ],
                    ) : SizedBox(),
                    const SizedBox(height: 20.0),
                     widget.kitchen == 'true' ? Row(
                      children: [
                        Icon(Icons.kitchen, color: Colors.blue, size: 30.0),
                        const SizedBox(width: 10.0),
                        Text('Kitchen', style: AppWidget.normalTextStyle(22.0)),
                      ],
                    ) : SizedBox(),
                    const SizedBox(height: 20.0),
                     widget.tv == 'true' ? Row(
                      children: [
                        Icon(Icons.tv, color: Colors.blue, size: 30.0),
                        const SizedBox(width: 10.0),
                        Text('TV', style: AppWidget.normalTextStyle(22.0)),
                      ],
                    ) : SizedBox(),
                    const SizedBox(height: 20.0),
                     widget.bathroom == 'true' ? Row(
                      children: [
                        Icon(Icons.bathroom, color: Colors.blue, size: 30.0),
                        const SizedBox(width: 10.0),
                        Text(
                          'Bathroom',
                          style: AppWidget.normalTextStyle(22.0),
                        ),
                      ],
                    ): SizedBox(),
                    Divider(thickness: 2.0),
                    const SizedBox(height: 5.0),
                    Text(
                      'About this place',
                      style: AppWidget.headLineTextStyle(20.0),
                    ),
                    Text(
                      widget.description, style: AppWidget.headLineTextStyle(20.0),
                    ),
                    const SizedBox(height: 10.0),
                    Material(
                      borderRadius: BorderRadius.circular(20.0),
                      elevation: 3.0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        //height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            Text(
                              '\$100 for 4 nights',
                              style: AppWidget.headLineTextStyle(20.0),
                            ),
                            const SizedBox(height: 3.0),
                            Text(
                              'Check-in Date',
                              style: AppWidget.normalTextStyle(18.0),
                            ),
                            Divider(),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  '12, Aug 2025',
                                  style: AppWidget.normalTextStyle(20.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Check-in Date',
                              style: AppWidget.normalTextStyle(18.0),
                            ),
                            Divider(),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  '20, Aug 2025',
                                  style: AppWidget.normalTextStyle(20.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Number of Guests',
                              style: AppWidget.normalTextStyle(20.0),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color(0xffececf8),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '1',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  'Book Now',
                                  style: AppWidget.whiteTextStyle(20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

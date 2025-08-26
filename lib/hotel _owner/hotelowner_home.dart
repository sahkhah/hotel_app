import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class HotelownerHome extends StatefulWidget {
  const HotelownerHome({super.key});

  @override
  State<HotelownerHome> createState() => _HotelownerHomeState();
}

class _HotelownerHomeState extends State<HotelownerHome> {
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
                  decoration: BoxDecoration(
                    color: Color.fromARGB(83, 0,0,0),
                    
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/wave.png',
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 5.0,),
                          Text('Hello Saka', style: AppWidget.boldWhiteTextStyle(20.0),)
                        ],
                      ),
                       Text('ready to welcome \n your new guest?', style: AppWidget.boldWhiteTextStyle(20.0),),
                       
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
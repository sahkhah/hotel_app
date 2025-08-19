import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        margin: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hotel Details', style: AppWidget.boldWhiteTextStyle(25.0),),
              ],
            ),
            const SizedBox(height: 20.0,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                     topRight: Radius.circular(20.0)),),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0,),
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            width: 2.0, 
                            color: Colors.black45,
                          ),
                          
                        ),
                        child: Icon(Icons.camera_alt, color: Colors.blue, size: 35.0,),
                        
                      ),
                    ),
                     SizedBox(height: 20.0,),
                     Text('Hotel Name', style: AppWidget.normalTextStyle(22.0),),
                     const SizedBox(height: 10.0,),
                     Container(
                       padding: const EdgeInsets.only(left: 20.0, ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffececf8),
                     ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: AppWidget.normalTextStyle(18.0),
                          hintText: 'Enter Hotel Name',
                          border: InputBorder.none,
                        ),
                      ),
                     ),
                     SizedBox(height: 20.0,),
                     Text('Hotel Room Charges', style: AppWidget.normalTextStyle(22.0),),
                     const SizedBox(height: 10.0,),
                     Container(
                       padding: const EdgeInsets.only(left: 20.0, ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffececf8),
                     ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: AppWidget.normalTextStyle(18.0),
                          hintText: 'Enter Room Charges',
                          border: InputBorder.none,
                        ),
                      ),
                     ),
              
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
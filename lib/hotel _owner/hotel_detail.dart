import 'dart:io';

import 'package:book_hotel/hotel%20_owner/hotelowner_home.dart';
import 'package:book_hotel/services/database_helper.dart';
import 'package:book_hotel/services/shared_prefs.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  String? userId;

  getOnTheShared() async {
    userId = await SharedPrefHelper().getUserId();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheShared();
    super.initState();
  }

  TextEditingController hotelName = TextEditingController();
  TextEditingController hotelCharges = TextEditingController();
  TextEditingController hotelAddress = TextEditingController();
  TextEditingController hotelDescription = TextEditingController();

  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    var pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    setState(() {});
  }

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
                Text(
                  'Hotel Details',
                  style: AppWidget.boldWhiteTextStyle(25.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      selectedImage != null
                          ? SizedBox(
                            width: 200,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          : GestureDetector(
                            onTap: () => getImage(),
                            child: Center(
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
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.blue,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ),
                      SizedBox(height: 20.0),
                      Text(
                        'Hotel Name',
                        style: AppWidget.normalTextStyle(20.0),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xffececf8),
                        ),
                        child: TextField(
                          controller: hotelName,
                          decoration: InputDecoration(
                            hintStyle: AppWidget.normalTextStyle(16.0),
                            hintText: 'Enter Hotel Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Hotel room charges',
                        style: AppWidget.normalTextStyle(20.0),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xffececf8),
                        ),
                        child: TextField(
                          controller: hotelCharges,
                          decoration: InputDecoration(
                            hintStyle: AppWidget.normalTextStyle(16.0),
                            hintText: 'Enter Room Charges',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Hotel Address',
                        style: AppWidget.normalTextStyle(20.0),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xffececf8),
                        ),
                        child: TextField(
                          maxLines: 3,
                          controller: hotelAddress,
                          decoration: InputDecoration(
                            hintStyle: AppWidget.normalTextStyle(16.0),
                            hintText: 'Enter hotel address',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'What service do you want to offer?',
                        style: AppWidget.normalTextStyle(20.0),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            onChanged: (bool? onchanged) {
                              setState(() {
                                isChecked1 = onchanged!;
                              });
                            },
                          ),
                          Icon(Icons.wifi, color: Colors.blue, size: 30.0),
                          const SizedBox(width: 10.0),
                          Text('WIFI', style: AppWidget.normalTextStyle(20.0)),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            onChanged: (bool? onchanged) {
                              setState(() {
                                isChecked2 = onchanged!;
                              });
                            },
                          ),
                          Icon(Icons.kitchen, color: Colors.blue, size: 30.0),
                          const SizedBox(width: 10.0),
                          Text(
                            'Kitchen',
                            style: AppWidget.normalTextStyle(20.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            onChanged: (bool? onchanged) {
                              setState(() {
                                isChecked3 = onchanged!;
                              });
                            },
                          ),
                          Icon(Icons.tv, color: Colors.blue, size: 30.0),
                          const SizedBox(width: 10.0),
                          Text('TV', style: AppWidget.normalTextStyle(20.0)),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            onChanged: (bool? onchanged) {
                              setState(() {
                                isChecked4 = onchanged!;
                              });
                            },
                          ),
                          Icon(Icons.bathroom, color: Colors.blue, size: 30.0),
                          const SizedBox(width: 10.0),
                          Text(
                            'Bathroom',
                            style: AppWidget.normalTextStyle(20.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Hotel description',
                        style: AppWidget.normalTextStyle(20.0),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xffececf8),
                        ),
                        child: TextField(
                          controller: hotelDescription,
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintStyle: AppWidget.normalTextStyle(16.0),
                            hintText: 'Enter about hotel',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            //String id = randomAlphaNumeric(10);

                            /*  Reference firebaseStorage = FirebaseStorage.instance
                                .ref()
                                .child('blogImage')
                                .child(id);

                            final UploadTask task = firebaseStorage.putFile(
                              selectedImage!,
                            );

                            // ignore: unused_local_variable
                            var downloadUrl =
                                await (await task).ref.getDownloadURL(); */

                            Map<String, dynamic> hotelMap = {
                              'id': userId,
                              'image': "'",
                              'hotelName': hotelName.text,
                              'hotelCharges': hotelCharges.text,
                              'hotelAddress': hotelAddress.text,
                              'hotelDescription': hotelDescription.text,
                              'wi-fi': isChecked1 ? 'true' : 'false',
                              'Kitchen': isChecked2 ? 'true' : 'false',
                              'HD-TV': isChecked3 ? 'true' : 'false',
                              'Bathroom': isChecked4 ? 'true' : 'false',
                            };

                            await DatabaseMethods().addHotel(hotelMap, userId!);
                            //await SharedPrefHelper().saveUserId(userId);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Hotel Details has been uploaded successfully',
                                ),
                              ),
                            );
                            Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HotelownerHome();
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 50,
                            child: Center(
                              child: Text(
                                ('Submit'),
                                style: AppWidget.boldWhiteTextStyle(25.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

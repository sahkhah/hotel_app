import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class DatabaseMethods {
  Future addUser(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .set(userInfo);
  }

  Future addHotel(Map<String, dynamic> hotelInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection('Hotels')
        .doc(id)
        .set(hotelInfo);
  }

  Future<Stream<QuerySnapshot>> getHotel() async {
    return FirebaseFirestore.instance.collection('Hotels').snapshots();
  }

  Future addUserBooking(
    Map<String, dynamic> userInfo,
    String id,
    String bookingId,
  ) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Booking')
        .doc(bookingId)
        .set(userInfo);
  }

  Future addHotelOwnerBooking(
    Map<String, dynamic> userInfo,
    String id,
    String bookingId,
  ) async {
    return await FirebaseFirestore.instance
        .collection('Hotels')
        .doc(id)
        .collection('Booking')
        .doc(bookingId)
        .set(userInfo);
  }

  Future<Stream<QuerySnapshot>> getUserBookings(String id) async {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Booking')
        .snapshots();
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: email)
        .get();
  }
}

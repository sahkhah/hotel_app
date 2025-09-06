import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class DatabaseMethods {
  //collected id from our end
  Future addUser(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .set(userInfo);
  }

  //id is a random number gotten from the signup page
  //a hotel owner can also be a user
  Future addHotel(Map<String, dynamic> hotelInfo, String userId) async {
    return await FirebaseFirestore.instance
        .collection('Hotels')
        .doc(
          userId,
        ) //random id passed from the signup page to the hotel_details page
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

  Future addUserTransactions(
    Map<String, dynamic> userInfo,
    String id,)
    async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Transactions')
        .add(userInfo);
  }

  Future<Stream<QuerySnapshot>> getUserBookings(String id) async {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Booking')
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getHotelOwnerBookings(String id) async {
    return FirebaseFirestore.instance
        .collection('Hotels')
        .doc(id)
        .collection('Booking')
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getUserTransactions(String id) async {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Transactions')
        .snapshots();
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: email)
        .get();
  }

  Future updateWallet(String id, String walletAmount) async {
    return await FirebaseFirestore.instance.collection('Users').doc(id).update({
      'wallet': walletAmount,
    });
  }
}

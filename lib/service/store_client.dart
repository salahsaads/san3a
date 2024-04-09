// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/info_model.dart';
import 'package:project/model/info_model_client.dart';

class FireStore_client {
  static final auth = FirebaseAuth.instance;

  CollectionReference users =
      FirebaseFirestore.instance.collection('users_client');

  Future<void> addUser_client(
      {required String fullName,
      required String email_type,
      required String phonenumber,
      required String email}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'email_type': email_type,
          'full_name': fullName,
          'phonenumber': phonenumber,
          'email': email,
        })
        .then((value) => print("===User Added"))
        .catchError(
            (error) => print("--------------Failed to add User: $error"));
  }

/////////////////////////////////////////////////////////////////////////////
  ///
  ///

  Future<Info_Model_Client> Get_Info_client() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users_client')
              .where('email', isEqualTo: user.email)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Convert the first document's data to Info_Model
        String docId = querySnapshot.docs.first.id;
        Info_Model_Client data =
            Info_Model_Client.fromJson(querySnapshot.docs.first.data());
        data.id = docId;

        return data;
      } else {
        // If no matching document found, return null or throw an error
        // Depending on your use case
        throw Exception("No user found with email ${user.email}");
        // You can also return null if you prefer
        // return null;
      }
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }

  ////////////////////////////////////////////////////////////////////

  Future<List<Info_Model>> Get_Info_all() async {
    // Get current authenticated user
    List<Info_Model> productList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      // Loop through the documents in the query result and convert them to Product objects
      querySnapshot.docs.forEach((doc) {
        Info_Model product = Info_Model.fromJson(doc.data());
        productList.add(product);
      });
    } catch (e) {
      print('Error retrieving products: $e');
      // Handle any errors (e.g., no internet connection, Firestore permission issues)
    }

    return productList;
  }
}

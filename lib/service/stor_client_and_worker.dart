// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/Email_type_model.dart';
import 'package:project/model/like1_model.dart';

class FireStore_client_worker {
  static final auth = FirebaseAuth.instance;

  CollectionReference users =
      FirebaseFirestore.instance.collection('users_email_type');

  Future<void> addEmail_type(
      {required String email_type, required String email}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'email_type': email_type,
          'email': email,
        })
        .then((value) => print("===add Email type"))
        .catchError(
            (error) => print("--------------Failed add Email typr: $error"));
  }

/////////////////////////////////////////////////////////////////////////////
  ///
  ///

  Future<Email_Type_model> Get_Email_type() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users_email_type')
              .where('email', isEqualTo: user.email)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Convert the first document's data to Info_Model
        Email_Type_model data =
            Email_Type_model.fromJson(querySnapshot.docs.first.data());

        return data;
      } else {
        // If no matching document found, return null or throw an error
        // Depending on your use case
        throw Exception("No user found with email ${user.email}");
        // You can also return null if you prefer
      }
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }

  Stream<Email_Type_model?> getEmailTypeStream() {
    // Get the current authenticated user
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Return an empty stream if no user is authenticated
      return Stream.value(null);
    }

    // Reference to the user's document in Firestore
    var docRef =
        FirebaseFirestore.instance.collection('users_email_type').doc(user.uid);

    // Return a stream of Email_Type_model based on document snapshots
    return docRef.snapshots().map((docSnapshot) {
      if (docSnapshot.exists) {
        // Extract email_type from the document snapshot
        var emailType = docSnapshot.data()?['email_type'] as String?;
        if (emailType != null) {
          // Create and return Email_Type_model object
          return Email_Type_model(email_type: emailType);
        }
      }
      // Return null if document does not exist or email_type is not available
      return null;
    });
  }

 
}

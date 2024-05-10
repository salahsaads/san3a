// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/info_model.dart';
import 'package:project/model/info_model_client.dart';
import 'package:project/model/like1_model.dart';

class FireStore_client {
  static final auth = FirebaseAuth.instance;

  CollectionReference users =
      FirebaseFirestore.instance.collection('users_client');

  Future<void> addUser_client(
      {required String fullName,
      required String email_type,
      required String phonenumber,
      required String email,
      required String location}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'email_type': email_type,
          'full_name': fullName,
          'phonenumber': phonenumber,
          'email': email,
          'location': location
        })
        .then((value) => print("===User Added"))
        .catchError(
            (error) => print("--------------Failed to add User: $error"));
  }

/////////////////////////////////////////////////////////////////////////////
  ///
  ///

  CollectionReference users1 = FirebaseFirestore.instance.collection('like');

  Future<void> addUser_like1(
      {required String fullName,
      required String location,
      required String work,
      required String email,
      required String url,
      required String work_name,
      required String type}) {
    // Call the user's CollectionReference to add a new user
    User? user = FirebaseAuth.instance.currentUser;
    return users1
        .add({
          'full_name': fullName,
          'location': location,
          'work': work,
          'email': email,
          'url': url,
          'email_now': user!.uid,
          'workshop_name': work_name,
          'type': type
        })
        .then((value) => print("===User Added like"))
        .catchError(
            (error) => print("--------------Failed to add User like: $error"));
  }

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('like');

  Future<void> deleteUserLike({
    required String email_worker,
    required String type,
  }) async {
    try {
      // Query for documents that match the specified email and type
      User? user = FirebaseAuth.instance.currentUser;
      QuerySnapshot<Object?> querySnapshot = await usersCollection
          .where('email', isEqualTo: email_worker)
          .where('email_now', isEqualTo: user!.uid)
          .where('type', isEqualTo: type)
          .get();

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        // Delete each matching document
        for (QueryDocumentSnapshot<Object?> document in querySnapshot.docs) {
          await document.reference.delete();
          print('Deleted Like Document for $email_worker and type $type');
        }
      } else {
        print('No matching documents found for $email_worker and type $type');
      }
    } catch (error) {
      print('Failed to delete user like: $error');
    }
  }

  Future<List<Like1_model>> Get_like1() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Retrieve user data from Firestore
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('like')
                .where('email_now', isEqualTo: user.uid)
                .get();

        List<Like1_model> likeList = [];

        if (querySnapshot.docs.isNotEmpty) {
          // Convert all documents to Like1_model objects
          likeList = querySnapshot.docs
              .map((doc) => Like1_model.fromJson(doc.data()))
              .toList();

          return likeList;
        } else {
          // If no matching documents found, return empty list
          return likeList;
        }
      } catch (e) {
        // Handle any errors that occurred during the process
        print("Error fetching like data: $e");
        throw Exception("Failed to fetch like data");
      }
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }

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

  Future<String> delate_service(
      {required String email1, required String email2}) async {
    try {
      var collectionName = 'services'; // Replace with your collection name

      // Query 'image_work_all' collection to find the document with the matching email
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(collectionName)
              .where('email_worker', isEqualTo: email2)
              .where('email_user', isEqualTo: email1)
              .get();

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document (assuming there's only one document per email)
        var imageWorkDocument = querySnapshot.docs.first;

        // Extract the document ID from the 'image_work_all' collection
        var docId = imageWorkDocument.id;

        // Reference the document in the 'users' collection using the extracted docId
        var docRef =
            FirebaseFirestore.instance.collection(collectionName).doc(docId);

        // Use set with merge option to add/update the 'url' field in the 'users' document
        await docRef.delete();

        return 'yes';
      } else {
        return 'no';
      }
    } catch (e) {
      return 'no';
    }
  }

  Future<String> addImag_client(
      {required String url, required String email}) async {
    try {
      var collectionName = 'users_client'; // Replace with your collection name

      // Query 'image_work_all' collection to find the document with the matching email
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(collectionName)
              .where('email', isEqualTo: email)
              .get();

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        // Get the first document (assuming there's only one document per email)
        var imageWorkDocument = querySnapshot.docs.first;

        // Extract the document ID from the 'image_work_all' collection
        var docId = imageWorkDocument.id;

        // Reference the document in the 'users' collection using the extracted docId
        var docRef =
            FirebaseFirestore.instance.collection(collectionName).doc(docId);

        // Use set with merge option to add/update the 'url' field in the 'users' document
        await docRef.update({
          'url_client': url,
        });

        return 'yes';
      } else {
        return 'no';
      }
    } catch (e) {
      return 'no';
    }
  }

  Future<List<Info_Model>> Get_Info_all_search({required String search}) async {
    // Get current authenticated user
    List<Info_Model> productList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('work', isEqualTo: search)
              .get();

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

  Future<Like1_model?> Get_like1_one(
      {required String email, required String type}) async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Retrieve user data from Firestore
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('like')
                .where('email', isEqualTo: email)
                .where('type', isEqualTo: type)
                .limit(1) // Limit the result to one document
                .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Convert the document data to a Like1_model object
          Like1_model likeModel =
              Like1_model.fromJson(querySnapshot.docs.first.data());

          return likeModel;
        } else {
          // If no matching document found, return null
          return null;
        }
      } catch (e) {
        // Handle any errors that occurred during the process
        print("Error fetching like data: $e");
        throw Exception("Failed to fetch like data");
      }
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }
}

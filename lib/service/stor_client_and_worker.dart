// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/Email_type_model.dart';
import 'package:project/model/image_model_all.dart';
import 'package:project/model/info_model.dart';
import 'package:project/model/service_model.dart';

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
  ///
  ///
  ///

  Future<String> to_be_sure_user(
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
        await docRef.update({
          'to_be_sure_user': '1',
        });

        return 'yes';
      } else {
        return 'no';
      }
    } catch (e) {
      return 'no';
    }
  }

  Future<String> to_be_sure_worker(
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
        await docRef.update({
          'to_be_sure_worker': '1',
        });

        return 'yes';
      } else {
        return 'no';
      }
    } catch (e) {
      return 'no';
    }
  }

  CollectionReference service =
      FirebaseFirestore.instance.collection('services');

  Future<void> add_service(
      {required String fullName_user,
      required String fullName_worker,
      required String location_worker,
      required String work,
      required String email_user,
      required String email_worker,
      required String to_be_sure_user,
      required String to_be_sure_worker,
      required String url_user,
      required String url_worker}) {
    // Call the user's CollectionReference to add a new user
    return service
        .add({
          'fullName_user': fullName_user,
          'fullName_worker': fullName_worker,
          'location_worker': location_worker,
          'work': work,
          'email_user': email_user,
          'email_worker': email_worker,
          'to_be_sure_user': to_be_sure_user,
          'to_be_sure_worker': to_be_sure_worker,
          'url_user': url_user,
          'url_worker': url_worker,
        })
        .then((value) => print("=== Service add"))
        .catchError(
            (error) => print("--------------Failed add Service: $error"));
  }

  CollectionReference service_sure =
      FirebaseFirestore.instance.collection('services_sure');

/////////////////////////////////////////////////////////////////////////////
  Future<Info_Model> Get_Info_worker({required String email}) async {
    // Retrieve user data from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Convert the first document's data to Info_Model
      String docId = querySnapshot.docs.first.id;
      Info_Model data = Info_Model.fromJson(querySnapshot.docs.first.data());
      data.id = docId;

      return data;
    } else {
      // If no matching document found, return null or throw an error
      // Depending on your use case
      // throw Exception("No user found with email ${user.email}");
      // You can also return null if you prefer
      Info_Model info_model = Info_Model();
      return info_model;
    }
  }

  Future<List<Image_Model_work_all>> getImageWorkAll_worker1(
      {required String email}) async {
    // Get current authenticated user

    // Retrieve user data from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('image_work_all')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Convert all documents' data to Image_Model_work with document IDs
      List<Image_Model_work_all> imageDataList = querySnapshot.docs.map((doc) {
        // Extract document ID
        String documentId = doc.id;

        // Convert document data to Image_Model_work
        Image_Model_work_all imageData =
            Image_Model_work_all.fromJson(doc.data());

        // Add document ID to Image_Model_work
        imageData.id = documentId;

        return imageData;
      }).toList();
      return imageDataList;
    } else {
      // If no matching document found, return empty list
      return [];
    }
  }

  Future<Service_model?> Get_Services_all(
      {required String email1, required String email2}) async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;
    Service_model? service_model;
    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('services')
              .where('email_user', isEqualTo: email1)
              .where('email_worker', isEqualTo: email2)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Convert the first document's data to Info_Model
        Service_model data =
            Service_model.fromJson(querySnapshot.docs.first.data());

        return data;
      } else {
        // If no matching document found, return null or throw an error
        // Depending on your use case
        // You  can also return null if you prefer

        return service_model;
      }
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }

  Future<List<Service_model>> Get_Services1(
      {required String email, required String type_email}) async {
    try {
      // Query for documents matching the specified conditions
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('services')
              .where(type_email, isEqualTo: email)
              .get();

      // List to hold filtered Service_model objects
      List<Service_model> serviceList = [];

      // Process querySnapshot
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in querySnapshot.docs) {
          // Extract data from the document
          String toBeSureUser = doc['to_be_sure_user'];
          String toBeSureWorker = doc['to_be_sure_worker'];

          // Check conditions based on to_be_sure_user and to_be_sure_worker values
          if (toBeSureUser == '0' && toBeSureWorker == '0') {
            // Create Service_model object from document data
            Service_model service = Service_model.fromJson(doc.data());
            serviceList.add(service);
          } else if (toBeSureUser == '1' && toBeSureWorker == '0') {
            // Additional condition scenario
            // Handle additional logic if needed
            serviceList.add(Service_model.fromJson(doc.data()));
          } else if (toBeSureUser == '0' && toBeSureWorker == '1') {
            // Additional condition scenario
            // Handle additional logic if needed
            serviceList.add(Service_model.fromJson(doc.data()));
          }
        }
      }

      // Return the list of filtered Service_model objects
      return serviceList;
    } catch (e) {
      print('Error fetching services: $e');
      return []; // Return empty list in case of error
    }
  }

  Future<List<Service_model>> Get_Services2(
      {required String email, required String email_type}) async {
    // Get current authenticated user

    //Retrieve user data from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('services')
        .where(email_type, isEqualTo: email)
        .where('to_be_sure_user', isEqualTo: '1')
        .where('to_be_sure_worker', isEqualTo: '1')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Convert all documents' data to Image_Model_work with document IDs
      List<Service_model> service_List = querySnapshot.docs.map((doc) {
        // Convert document data to Image_Model_work
        Service_model service = Service_model.fromJson(doc.data());

        return service;
      }).toList();
      return service_List;
    } else {
      // If no matching document found, return empty list
      return [];
    }
  }
//   Future<void> fetchData(String email) async {
//   try {

//     // Query for documents where email_user is equal to email
//     QuerySnapshot<Map<String, dynamic>> querySnapshot = await  FirebaseFirestore
//        .instance
//         .collection('services')
//         .where('email_user', isEqualTo: email)
//         .get();

//     // List to hold filtered documents
//     List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredDocuments = [];

//     // Filter documents based on specified conditions
//     if (querySnapshot.docs.isNotEmpty) {
//       for (QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
//         // Get values of to_be_sure_user and to_be_sure_worker from the document
//         String toBeSureUser = doc['to_be_sure_user'];
//         String toBeSureWorker = doc['to_be_sure_worker'];

//         // Check conditions: to_be_sure_user != '1' && to_be_sure_worker != '1' && to_be_sure_user != to_be_sure_worker
//         if (toBeSureUser != '1' && toBeSureWorker != '1' && toBeSureUser != toBeSureWorker) {
//           filteredDocuments.add(doc);
//         }
//       }

//     }

//     // Process filtered documents
//     if (filteredDocuments.isNotEmpty) {
//       // Loop through the filtered documents
//       for (QueryDocumentSnapshot<Map<String, dynamic>> doc in filteredDocuments) {
//         // Access document data
//         Map<String, dynamic> data = doc.data();
//         print('Document ID: ${doc.id}');
//         print('Data: $data');

//         // Perform operations on retrieved documents here
//       }
//     } else {
//       print('No documents found matching the criteria.');
//     }
//   } catch (e) {
//     print('Error fetching data: $e');
//     // Handle error as needed
//   }
// }

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

  Future<void> delete_service1(String email1, String email2) async {
    try {
      // Reference to the collection
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('services')
              .where('email_user', isEqualTo: email1)
              .where('email_worker', isEqualTo: email2)
              .get();

      // Check if any documents were found
      if (querySnapshot.docs.isNotEmpty) {
        // Loop through the documents (there should be only one matching document in this case)
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in querySnapshot.docs) {
          // Get the document reference and delete it
          await FirebaseFirestore.instance
              .collection('services')
              .doc(doc.id)
              .delete();
          print(
              'Document with email_user $email1 and email_worker $email2 deleted successfully.');
        }
      } else {
        print(
            'No document found with email_user $email1 and email_worker $email2.');
      }
    } catch (e) {
      print('Error deleting document: $e');
      // Handle error as needed
    }
  }
}

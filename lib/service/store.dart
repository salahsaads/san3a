// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/model/image_model_all.dart';
import 'package:project/model/image_model_work.dart';
import 'package:project/model/info_model.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
      {required String workshop_name,
      required String fullName,
      required String dateOfBirth,
      required String location,
      required String phonenumber,
      required String work,
      required String email,
      required String email_type}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'email_type': email_type,
          'full_name': fullName,
          'dateofbirth': dateOfBirth,
          'location': location,
          'phonenumber': phonenumber,
          'work': work,
          'email': email,
          'workshop_name': workshop_name,
        })
        .then((value) => print("===User Added"))
        .catchError(
            (error) => print("--------------Failed to add User: $error"));
  }

  CollectionReference image_url_work =
      FirebaseFirestore.instance.collection('image_work');
  Future<void> addImage_pro({required String url, required User email}) {
    // Call the user's CollectionReference to add a new user
    return image_url_work
        .add({
          'email': email.uid,
          'image_url': url,
        })
        .then((value) => print("Image Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

///////////////////////////////////////////////////////////////////////////
  CollectionReference image_url_work3 =
      FirebaseFirestore.instance.collection('image_work_prof');
  Future<void> addImage_pro2({required String url, required User email}) {
    // Call the user's CollectionReference to add a new user
    return image_url_work3
        .add({
          'email': email.uid,
          'image_url': url,
        })
        .then((value) => print("Image Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<Image_Model_work> Get_Image_prof2() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('image_work_prof')
              .where('email', isEqualTo: user.uid)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Convert the first document's data to Info_Model
        String? id;
        querySnapshot.docs.map((e) {
          id = e.id;
        });
        Image_Model_work data =
            Image_Model_work.fromJson(querySnapshot.docs.last.data());
        data.id = id;
        print('----------------------$id');
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

  ///////////////////////////////////////////////////////////////////////////////////////
  CollectionReference image_url_work_all =
      FirebaseFirestore.instance.collection('image_work_all');
  Future<void> addImage_work({required String url, required User email}) {
    // Call the user's CollectionReference to add a new user
    return image_url_work_all
        .add({
          'email': email.uid,
          'image_url': url,
        })
        .then((value) => print("Image Added"))
        .catchError((error) => print("Failed to add Image: $error"));
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  CollectionReference image_url_work_all2 =
      FirebaseFirestore.instance.collection('image_work_all2');
  Future<void> addImage_work2({required String url, required User email}) {
    // Call the user's CollectionReference to add a new user
    return image_url_work_all2
        .add({
          'email': email.uid,
          'image_url': url,
        })
        .then((value) => print("Image Added"))
        .catchError((error) => print("Failed to add Image: $error"));
  }

  Future<Info_Model> Get_Info() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: user.email)
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
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }

  ////////////////////////////////////////////////////////////////
  ///
  Future<Image_Model_work> Get_Image_work() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('image_work')
              .where('email', isEqualTo: user.uid)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Convert the first document's data to Info_Model
        String? id;
        querySnapshot.docs.map((e) {
          id = e.id;
        });
        Image_Model_work data =
            Image_Model_work.fromJson(querySnapshot.docs.last.data());
        data.id = id;
        print('----------------------$id');
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

  /////////////////////////////////////////////////////////
  Future<List<Image_Model_work_all>> getImageWorkAll() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('image_work_all')
              .where('email', isEqualTo: user.uid)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Convert all documents' data to Image_Model_work with document IDs
        List<Image_Model_work_all> imageDataList =
            querySnapshot.docs.map((doc) {
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
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }

/////////////////////////////////////////////////////////////////////////////

  Future<void> deleteImage(String documentId) async {
    try {
      // Get the document reference using the document ID
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('image_work_all')
          .doc(documentId); // Assuming 'image_work' is your collection name

      // Delete the document
      await documentReference.delete();

      print('Image deleted successfully');
    } catch (error) {
      print('Error deleting image: $error');
      // Handle error as needed
    }
  }

  Future<void> deleteImage2(String documentId) async {
    try {
      // Get the document reference using the document ID
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('image_work_all2')
          .doc(documentId); // Assuming 'image_work' is your collection name

      // Delete the document
      await documentReference.delete();

      print('Image deleted successfully');
    } catch (error) {
      print('Error deleting image: $error');
      // Handle error as needed
    }
  }

////////////////////////////////////////////////////////////////////////////////
  static Future<void> AddUserInfo(
    String fullname,
    String dateOfBirth,
    String location,
    String phonenumber,
  ) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .set({
      'fullname': fullname,
      'dateOfBirth': dateOfBirth,
      'location': location,
      'phonenumber': phonenumber,
    });
  }

  /////////////////////////////////////////////////////////////////////////////////
  ///
  Future<void> deleteImageWork(String documentId) async {
    try {
      // Get the document reference using the document ID
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('image_work')
          .doc(documentId); // Assuming 'image_work' is your collection name

      // Delete the document
      await documentReference.delete();

      print('Image deleted successfully');
    } catch (error) {
      print('Error deleting image: $error');
      // Handle error as needed
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////
  Future<void> Update_Prof(String documentId, String workshop_name) async {
    try {
      // Get the document reference using the document ID
      FirebaseFirestore.instance.collection('users').doc(documentId).update({
        'workshop_name': workshop_name
      }); // Assuming 'image_work' is your collection name

      print('Image Update successfully');
    } catch (error) {
      print('Error Update  image: $error');
      // Handle error as needed
    }
  }

  /* static Future<void> AddStory(
    String username,
    String userimage,
    String storyimage,
    String date,
  ) async {
    await FirebaseFirestore.instance.collection('Stories').add({
      'username': username,
      'userimage': userimage,
      'storyimage': storyimage,
      'date': date,
      'userid': auth.currentUser!.uid,
    });
  }
*/
  /* static Future<void> AddPost(String username, String userimage,
      String postimage, String date, String title) async {
    await FirebaseFirestore.instance.collection('posts').add({
      'username': username,
      'userimage': userimage,
      'postimage': postimage,
      'date': date,
      'title': title,
      'userid': auth.currentUser!.uid,
    });
  }
*/
  // static Future<void> AddPostComment(String postid,String comment,String username,String userimage,String date) async {
  //   await FirebaseFirestore.instance
  //       .collection('posts').doc(postid).collection('comments').add({
  //         'comment':comment,
  //         'username':username,
  //         'userimage':userimage,
  //         'date':date,
  //         'userid':auth.currentUser!.uid,

  //   });
  // }
  /*static Future<void> AddSavedList(String username, String userimage,
      String postimage, String date, String title) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection("saved_list")
        .add({
      'username': username,
      'userimage': userimage,
      'postimage': postimage,
      'date': date,
      'title': title,
    });
  }*/

  /////////////////////////////////////////////////////////
  Future<List<Image_Model_work_all>> getImageWorkAll2() async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('image_work_all2')
              .where('email', isEqualTo: user.uid)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Convert all documents' data to Image_Model_work with document IDs
        List<Image_Model_work_all> imageDataList =
            querySnapshot.docs.map((doc) {
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
    } else {
      // If no user is currently authenticated, handle this case accordingly
      throw Exception("User not authenticated");
    }
  }

/////////////////////////////////////////////////////////////////////////////
}

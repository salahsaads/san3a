// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/image_model_work.dart';
import 'package:project/model/info_model.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference image_url_work =
      FirebaseFirestore.instance.collection('image_work');
  Future<void> addUser(
      {required String workshop_name,
      required String fullName,
      required String dateOfBirth,
      required String location,
      required String phonenumber,
      required String work,
      required String email}) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
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
            (error) => print("--------------Failed to add Image: $error"));
  }

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
        Info_Model data = Info_Model.fromJson(querySnapshot.docs.first.data());
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
        Image_Model_work data = Image_Model_work.fromJson(querySnapshot.docs.first.data());
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
}

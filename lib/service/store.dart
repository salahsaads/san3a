// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;

 CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser({required String fullName,required  String dateOfBirth,required String location,required String phonenumber, required String work}) {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName,
            'dateofbirth':dateOfBirth,
            'location':location,
            'phonenumber':phonenumber,
            'work':work,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
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

  static Future<void> AddStory(
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

  static Future<void> AddPost(String username, String userimage,
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
  static Future<void> AddSavedList(String username, String userimage,
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
  }
}

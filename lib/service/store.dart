// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/comment_model.dart';
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

  //////////////////////////////////////////////////////////////////////////////

  void addImageUser({required String url, required String email}) async {
    try {
      var collectionName = 'users'; // Replace with your collection name

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
          'url': url,
        });

        print('Field added successfully!');
      } else {
        print('No document found in image_work_all with email: $email');
      }
    } catch (e) {
      print('Error adding image URL: $e');
    }
  }

/////////////////////////////////////////////////////////////////////////////////////

  void addImageUser2({required String url, required String email}) async {
    try {
      var collectionName = 'users'; // Replace with your collection name

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
          'url_work': url,
        });

        print('Field added successfully!');
      } else {
        print('No document found in image_work_all with email: $email');
      }
    } catch (e) {
      print('Error adding image URL: $e');
    }
  }

/////////////////////////////////////////////////////////////////////////////////////
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

  CollectionReference ratings = FirebaseFirestore.instance.collection('rating');

// Function to get all ratings and calculate their sum
  Future<double> getTotalRatingSum({required String email}) async {
    double totalSum = 0.0;

    try {
      QuerySnapshot querySnapshot =
          await ratings.where('email_worker', isEqualTo: email).get();

      // Loop through each document in the query snapshot
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          // Extract the 'rating' field from the document data
          dynamic ratingData = doc.get('rating');

          // Validate and convert the rating data to a double
          if (ratingData != null && ratingData is num) {
            double rating = ratingData.toDouble();

            // Add the rating to the total sum
            totalSum += rating;
          } else {
            print("Invalid or missing 'rating' field in document ${doc.id}");
          }
        } else {
          print("Document ${doc.id} does not exist");
        }
      });

      print("Total Rating Sum: $totalSum");
      if (totalSum == 0) {
        return 0;
      } else {
        return totalSum / querySnapshot.size;
      }
    } catch (error) {
      print("Failed to get total rating sum: $error");
      return 0.0; // Return 0.0 in case of error
    }
  }

  CollectionReference ratingsCollection =
      FirebaseFirestore.instance.collection('rating');

  Future<void> addRating(
      {required double rating,
      required String email,
      required String comment,
      required String url_user,
      required String full_name_user}) {
    // Call the add method on the CollectionReference to add a new document
    return ratingsCollection
        .add({
          'rating': rating,
          'email_worker': email,
          'comment': comment,
          'url_user': url_user,
          'full_name_user': full_name_user
        })
        .then((value) => print("Rating added successfully"))
        .catchError((error) => print("Failed to add rating: $error"));
  }

 Future<List<Comment_Model>> getComments(String email) async {
    // Check if user is authenticated
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not authenticated");
    }

    // Retrieve comments from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('rating')
        .where('email_worker', isEqualTo: email)
        .get();

    List<Comment_Model> comments = [];

    if (querySnapshot.docs.isNotEmpty) {
      // Convert each document's data to Comment_Model and add to the list
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
        Comment_Model comment = Comment_Model.fromJson(doc.data());
        comments.add(comment);
      }
      return comments;
    } else {
      // If no matching documents found, handle this case accordingly
      throw Exception("No comments found for email $email");
      // You can also return an empty list if you prefer
      // return [];
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////
  CollectionReference image_url_work_all =
      FirebaseFirestore.instance.collection('image_work_all');
  Future<void> addImage_work({required String url, required String email}) {
    // Call the user's CollectionReference to add a new user
    return image_url_work_all
        .add({
          'email': email,
          'image_url': url,
        })
        .then((value) => print("Image Added"))
        .catchError((error) => print("Failed to add Image: $error"));
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  CollectionReference image_url_work_all2 =
      FirebaseFirestore.instance.collection('image_work_all2');
  Future<void> addImage_work2({required String url, required String email}) {
    // Call the user's CollectionReference to add a new user
    return image_url_work_all2
        .add({
          'email': email,
          'image_url': url,
        })
        .then((value) => print("Image Added"))
        .catchError((error) => print("Failed to add Image: $error"));
  }

// Function to update a user document based on email
  Future<void> updateRating(
      {required String email, required double rating}) async {
    try {
      // Query for the user document with the matching email
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      // Check if a document was found with the matching email
      if (querySnapshot.size > 0) {
        // Get the reference to the first document (assuming only one document matches)
        DocumentSnapshot userDoc = querySnapshot.docs.first;

        // Update the document with the provided data
        await userDoc.reference.update({
          'rating': rating,
        });

        print("User document updated successfully for email: $email");
      } else {
        print("No user found with email: $email");
        // Handle case where no user was found with the specified email
      }
    } catch (error) {
      print("Failed to update user document: $error");
      // Handle any potential errors that occur during the update operation
    }
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
  Future<Image_Model_work> Get_Image_work({required String email}) async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('image_work')
              .where('email', isEqualTo: email)
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
  Future<List<Image_Model_work_all>> getImageWorkAll(
      {required String email}) async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('image_work_all')
              .where('email', isEqualTo: email)
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
  Future<List<Image_Model_work_all>> getImageWorkAll2(
      {required String email}) async {
    // Get current authenticated user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve user data from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('image_work_all2')
              .where('email', isEqualTo: email)
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
  ///
  ///

  void getDocumentID({required String collectionName}) async {
    try {
      // Specify the collection path
      // Replace with your collection name

      // Access the Firestore instance and specify the collection
      var collectionRef = FirebaseFirestore.instance.collection(collectionName);

      // Get the documents in the collection
      var querySnapshot = await collectionRef.get();

      // Loop through the documents to retrieve the IDs
      querySnapshot.docs.forEach((doc) {
        var docID = doc.id;
        print('Document ID: $docID');
        // You can use this docID as needed, such as for updating or deleting documents
      });
    } catch (e) {
      print('Error getting document ID: $e');
    }
  }


  
}

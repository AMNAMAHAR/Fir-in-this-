import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String password, String email, String confirmPassword,String name, String userId) {
    // Use 'set' method to add or update a document in the 'User' collection
    firestore.collection('User').doc(userId).set({
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'fullName': name,
      'userId': userId,
    }).then((value) {
      print("Data added successfully!");
    }).catchError((error) {
      print("Failed to add data: $error");
    });
  }
}

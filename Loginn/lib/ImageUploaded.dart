import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadImage {
  final storageRef = FirebaseStorage.instance.ref('/Image');
  String? url;

  Future<String?> uploadImage(File filePath) async {
    try {
      final task = storageRef.child('UserProfile/Images${filePath.path}').putFile(filePath);
      await task.whenComplete(() {});

      final downloadUrl = await task.snapshot.ref.getDownloadURL();
      url = downloadUrl.toString();
      return url;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
//
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';
//
// Future<String?> uploadFile(File file) async {
//   try {
//     String fileName = basename(file.path);
//     Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');
//     UploadTask uploadTask = firebaseStorageRef.putFile(file);
//
//     TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//     String downloadURL = await taskSnapshot.ref.getDownloadURL();
//
//     return downloadURL;
//   } catch (e) {
//     print('Error uploading file: $e');
//     return null;
//   }
// }
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadVideo {
  final storageRef = FirebaseStorage.instance.ref('/Image');
  String? url;

  Future<String> uploadVideo(File filePath) async {
    try {
      final task =
      storageRef.child('UserProfile/Videos${filePath.path}').putFile(filePath);
      await task.whenComplete(() {});
      final downloadUrl = await task.snapshot.ref.getDownloadURL();
      url = downloadUrl.toString();
      return url!;
    } catch (e) {
      print('Error uploading Video: $e');
      return null!;
    }
  }
}

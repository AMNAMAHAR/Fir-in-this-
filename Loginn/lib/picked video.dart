import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:loginn/Audio%20player.dart';
import 'package:loginn/ImageUploaded.dart';
import 'package:loginn/Video_Uploaded.dart';
import 'package:loginn/Video_player.dart';
import 'package:loginn/pdfView.dart';

class PcikedVideo extends StatefulWidget {
  File? filePath;
String? videoUrl;
  @override
  State<PcikedVideo> createState() => _PcikedVideoState();
}

class _PcikedVideoState extends State<PcikedVideo> {
  // String? imageurl; // Declare imageurl here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //
            // ElevatedButton(
            //     onPressed: () async {
            //       FilePickerResult? result = await FilePicker.platform.pickFiles(
            //         type: FileType.image,
            //       );
            //       if (result != null) {
            //         File file = File(result.files.single.path!);
            //       } else {
            //         print('No file selected');
            //       }
            //
            //
            //     }, child: Text('Imagepicker'),

            // Display the image URL if available
            // ),


            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                await FilePicker.platform.pickFiles(type: FileType.video);

                if (result != null) {
                  File file = File(result.files.single.path!);

               var   videoUrl = await UploadVideo().uploadVideo(file);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoApp(file)),
                  );
                } else {
                  // User canceled the picker
                }
              },
              child: Text('Picked Video', style: TextStyle(color: Colors.grey)),
            ),

            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                await FilePicker.platform.pickFiles(type: FileType.audio);
                if (result != null) {
                  File file = File(result.files.single.path!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AudioPlay(file)),
                  );
                } else {
                  // User canceled the picker
                }
              },
              child: Text('Pick Audio', style: TextStyle(color: Colors.orange)),
            ),

            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  pdfview(file)),
                  );
                } else {
                  // User canceled the picker
                }
              },
              child: Text('Pick Pdf', style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}

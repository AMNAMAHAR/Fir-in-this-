import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginn/ImageUploaded.dart';
import 'package:loginn/Signin.dart';
import 'package:loginn/picked%20video.dart';
import 'dataservice.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late String userId;
  File? filePath;
String? ImageUrl;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock,),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    labelText: 'Enter Name',
                    suffixIcon: Icon(Icons.drive_file_rename_outline_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                        color: Colors.grey,

                      ),

                      ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    ),
                  ),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Enter Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Enter passward',
                    suffixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  controller: phoneController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    labelText: 'Enter confirm password',
                    suffixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('I have read and accept the\n terms of service.'),
                  Switch(
                    value: _showPassword,
                    onChanged: (value) {
                      setState(() {
                        _showPassword = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),));
                  signUp();
                },
                child: Text('SignUp', style: TextStyle(color: Colors.black)),
              ),
              if (filePath != null)
                Container(
                  height: 200,
                  width: 300,
                  child: Image.file(filePath!),
                ),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                  await FilePicker.platform.pickFiles();

                  if (result != null) {
                    setState(() {
                      filePath = File(result.files.single.path!);
                      ImageUrl =  UploadImage().uploadImage(filePath!) as String?;
                    });
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text('Image Picker', style: TextStyle(color: Colors.red)),
              ),

              // ElevatedButton(
              //   onPressed: () async {
              //     if (filePath != null) {
              //      String
              //       if (imageUrl != null) {
              //         print('Image URL: $imageUrl');
              //         // Do something with the image URL if needed
              //       }
              //     }
              //   },
              //   child: Text('Upload Image', style: TextStyle(color: Colors.blue)),
              // ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PcikedVideo(),));
                },
                child: Text('Picked (video, audio, pdf file)', style: TextStyle(color: Colors.green)),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 110),
                    width: 30,
                    height: 20,
                    child: Image.asset('assets/Images/download.png'),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 30,
                    height: 25,
                    child: Image.asset('assets/Images/download (1).png'),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/Images/download (3).png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (credential.additionalUserInfo!.isNewUser) {
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        DataService dataService = DataService();
        userId = firebaseAuth.currentUser!.uid;
        dataService.addData(
          nameController.text,
          emailController.text,
          passwordController.text,
          phoneController.text,
          userId,
        );

        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Your Registration was successful!",
        );

        emailController.clear();
        passwordController.clear();
        nameController.clear();
        phoneController.clear();
      } else {
        print('userId');
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: "You already have an account!",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }
}

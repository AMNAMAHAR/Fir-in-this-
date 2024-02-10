
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dataprofile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  File? filePath;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['Email']);

  // Function to handle Google Sign-In
  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = authResult.user;

        if (user != null) {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "Google Sign-In successful!",
          );
          // Do something with the signed-in user
          print('User signed in: ${user.displayName}');
        }
      }
    } catch (e) {
      print('Error during Google Sign-In: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginScreen'),
      ),
      body:Center(
        child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

                Center(
                  child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            obscureText: false, // Changed to false for email input
            decoration: InputDecoration(
              hintText: 'Email',
              suffixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: const Icon(Icons.password),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetUserName ()),
              );
              LoginScreen();
            },
            child: Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

          ),
          ElevatedButton(
            onPressed: _handleGoogleSignIn,
            child: Text('Google Sign-In', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ),
          if (filePath != null)
          ElevatedButton(
            onPressed: () async {
              // Pick Video File
              FilePickerResult? result = await FilePicker.platform
                  .pickFiles(
                type: FileType.custom,
                allowedExtensions: ['mp4', 'avi', 'mkv'],
              );

              if (result != null) {
                setState(() {
                  filePath = File(result.files.single.path!);

                });
              } else {
                print('Video file picked: ${filePath?.path}');
                LoginScreen();
              }
            },
            child: Text('Pick Video File'),
          ),
        SizedBox(height: 80,),
        Row(
        children: [

                Container(
                  margin: EdgeInsets.only(left: 110),

                  width: 30,
                  height: 20,
                  child:   Image.asset('assets/Images/download.png'),

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
        ]
                ),
        )
                  ],
        ),
                ),
      ),
    );
  }
  Future<void> Login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:emailController.text, password: passwordController.text);
      if(credential.user!=null) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          // Changed to success for successful registration
          text: "Your Registration was successful!",
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => GetUserName(),));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'Signn.dart';
import 'homescreen.dart';
class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  RxBool isloading = false.obs;
  Future<void> signUpwithEmailandPwd() async {
    isloading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('Login Done❤💕');
      isloading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print(' ❌❌The password provided is too weak.');
        isloading.value = false;
      } else if (e.code == 'email-already-in-use') {
        print('💥💟The account already exists for that email.');
        isloading.value = false;
      }
    }
    isloading.value = false;
  }

  Future<void> loginwithEmailAndPwd(String email, String Pwd) async {
    isloading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: Pwd);
      print('SignIn in Done');
      isloading.value = false;
      Get.offAll(HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        isloading.value = false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        isloading.value = false;
      }
    }
    isloading.value = false;
  }

  Future<void> logout() async {
    await auth.signOut();
    Get.offAll(SignUp());
  }

  Future<void> signinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await auth.signInWithCredential(credential);
  }
}
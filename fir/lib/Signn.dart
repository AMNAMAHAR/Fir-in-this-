import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'LoginScreen.dart';
import 'authcontroller.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Center(child: Text('Sign Up')),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            height: 250.0,

            child: Image.asset('assets/images/istockphoto-1175445207-612x612 (1).jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: authController.emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      fillColor: Colors.yellow.shade200,
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      label: Text('Enter your email'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: authController.passwordController,
                    decoration: InputDecoration(
                      label: Text('Enter your password'),
                      fillColor: Colors.yellow.shade200,
                      filled: true,
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: (){
                    authController.signUpwithEmailandPwd();
                  },
                  icon: Icon(Icons.face_unlock_outlined),
                  label: Text('Sign Up',style: TextStyle(color: Colors.black38),),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              ),backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: (){
              Get.to(LoginPage());
            },
            icon: Icon(Icons.lock_person),
            label: Text('Login ',style: TextStyle(color: Colors.grey),),
          ),
          SizedBox(
            height: 30,
          ),
          SignInButton(
              buttonType: ButtonType.google,
              buttonSize: ButtonSize.large, // small(default), medium, large
              onPressed: () {
                authController.signinWithGoogle();
              }
          ),
        ]
        ),
      ),
    );
  }
}
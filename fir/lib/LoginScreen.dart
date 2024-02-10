import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Signn.dart';
import 'authcontroller.dart';
import 'homescreen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          'Login',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            height: 300.0,
            child: Image.asset('assets/images/istockphoto-1175445207-612x612 (1).jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' Login ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: password,
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
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    authController.loginwithEmailAndPwd(
                        email.text, password.text);
                  },
                  icon: Icon(Icons.wifi),
                  label: Text('Login'),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.deepPurpleAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Get.to(SignUp());
                  },
                  icon: Icon(Icons.lock_person),
                  label: Text('Sign Up'),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUp());
                  },
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        child: Text("Aleardy' have an account Signup"),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text('Home Page'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
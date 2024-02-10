import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authcontroller.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/istockphoto-1175445207-612x612 (1).jpg'),
          ),
          SizedBox(
            height: 20,
          ),
          const Text('Home Page',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text('you are loged in ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              authController.logout();
            },
            child: Text('LogOut '),
          ),
        ],
      ),
    );
  }
}

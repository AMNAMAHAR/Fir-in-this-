import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUp(),
    );
  }
}
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//       Duration(seconds: 3),
//           () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => SignUp()),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/Images/23.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Developer',
//                 style: TextStyle(
//                   fontSize: 70,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

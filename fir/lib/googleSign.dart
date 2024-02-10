import 'package:flutter/material.dart';
class Google extends StatefulWidget {
  const Google({super.key});
  @override
  State<Google> createState() => _GoogleState();
}
class _GoogleState extends State<Google> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email= TextEditingController();
    TextEditingController password= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Google'),
      ),
      body: Column(
        children: [
          Container(
            child: Text('Google'),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              label: Text('email'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              label: Text('paassword'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
          )
        ],
      ),
    );
  }
}

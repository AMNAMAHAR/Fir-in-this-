import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GetUserName extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth=FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('User');

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(firebaseAuth.currentUser!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
      
          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }
      
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              children: [
                Gap(70),
                Card(
                  child: ListTile(
                    title:  Text('FullName:${data['name ']}'),
                      subtitle:  Text('Email:${data['password']}'),

                  ),
                ),

              ],
            );
          }
      
          return Text("loading");
        },
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/color_app.dart';

class GetName extends StatelessWidget {
  const GetName({Key? key, required this.documentID}) : super(key: key);
  final String documentID;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentID).get(),
      builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          if(data["email"] == FirebaseAuth.instance.currentUser!.email){
            return Text(
              data['name'],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorApp.primaryColor),
            );
          }
        }
        return Text('Load...');
      }),
    );
  }
}

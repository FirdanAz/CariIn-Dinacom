import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../common/color_app.dart';

class CardData extends StatelessWidget {
  CardData(
      {Key? key,
      required this.documentID,
      required this.title,
      required this.value})
      : super(key: key);
  final String documentID;
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentID).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data["email"] == FirebaseAuth.instance.currentUser!.email) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: ColorApp.accentColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 55.h,
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.black),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: data['$value'],
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: ColorApp.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
        return Text('Load...');
      }),
    );
  }
}

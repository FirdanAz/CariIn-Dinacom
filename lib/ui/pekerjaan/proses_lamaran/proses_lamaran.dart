import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/not_login.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/proses_lamaran/no_have.dart';
import 'package:lowongan_pekerjaan/ui/widget/Pekerjaan_card.dart';

import '../not_login.dart';

class ProsesLamaranTab extends StatelessWidget {
  ProsesLamaranTab({super.key});
  bool isHaveLamaran = true;

  final CollectionReference _prosesLamaran = FirebaseFirestore.instance
      .collection('user')
      .doc('pfDgeo0P06NwmaIgGfcl')
      .collection('lowongan').doc('Mobile Development').collection('6pz9xxOB3GMc7qTg8iJ8B2OxEom2');

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null
        ? PekerjaanNotLoginPage()
        : isHaveLamaran
        ? StreamBuilder(
      stream: _prosesLamaran.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData){
          return ListView.separated(
            itemCount: streamSnapshot.data!.docs.length,
            padding: EdgeInsets.all(25.h),
            separatorBuilder: (context, index) => Divider(
              height: 20.h,
              color: Colors.transparent,
            ),
            itemBuilder: (context, index) {
              final DocumentSnapshot documnentSnapshot =
              streamSnapshot.data!.docs[index];
              return PekerjaanCard(
                status: documnentSnapshot['companyName'],
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
        )
        : const NoHaveProsesLamaran();
  }
}

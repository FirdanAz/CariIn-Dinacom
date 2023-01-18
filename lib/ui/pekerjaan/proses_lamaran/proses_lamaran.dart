import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/not_login.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/proses_lamaran/no_have.dart';
import 'package:lowongan_pekerjaan/ui/widget/Pekerjaan_card.dart';

class ProsesLamaranTab extends StatefulWidget {
  ProsesLamaranTab({super.key});

  @override
  State<ProsesLamaranTab> createState() => _ProsesLamaranTabState();
}

class _ProsesLamaranTabState extends State<ProsesLamaranTab> {
  final CollectionReference _lowongan = FirebaseFirestore.instance
        .collection('user')
      .doc('pfDgeo0P06NwmaIgGfcl')
      .collection('lowongan').doc().collection(FirebaseAuth.instance.currentUser!.uid);
  bool isHaveLamaran = true;

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null
        ? const PekerjaanNotLoginPage()
        : isHaveLamaran
            ? ListView.separated(
                itemCount: 5,
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                separatorBuilder: (context, index) => Divider(
                  height: 20.h,
                  color: Colors.transparent,
                ),
                itemBuilder: (context, index) {
                  return StreamBuilder(
                    stream: _lowongan.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documnentSnapshot =
                          streamSnapshot.data!.docs[index];
                          return PekerjaanCard(
                            status: "Sedang dicek oleh perusahaan",
                          );
                        },
                      );
                    },
                  );
                },
              )
            : const NoHaveProsesLamaran();
  }
}

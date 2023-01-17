import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/bottom_navigation/bottom_navigation.dart';
import 'package:lowongan_pekerjaan/ui/profil/pages/get_akun_data.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  final CollectionReference _lowongan =
      FirebaseFirestore.instance.collection('users');

  int index = 0;

  indexs() async {
    index = index;

    return StreamBuilder(
      stream: _lowongan.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        for (var i = 0; i < snapshot.data!.docs.length; i++) {
          setState(() {
            index = i;
          });
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Akun",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 10,
        toolbarHeight: 70.h,
        backgroundColor: ColorApp.secondaryColor,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _lowongan.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            String documentID = FirebaseAuth.instance.currentUser!.uid;
            if (streamSnapshot.hasData) {
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(25.h),
                    child: Column(
                      children: [
                        CardData(
                            documentID: documentID,
                            title: 'Nama Pengguna',
                            value: 'name'),
                        SizedBox(height: 15.h),
                        CardData(
                            documentID: documentID,
                            title: 'Email',
                            value: 'email'),
                        SizedBox(height: 15.h),
                        CardData(
                            documentID: documentID,
                            title: 'Nomor Telepon',
                            value: 'nomor'),
                        SizedBox(height: 15.h),
                        CardData(
                            documentID: documentID,
                            title: 'Tanggal Lahir',
                            value: 'date'),
                        SizedBox(height: 15.h),
                        CardData(
                            documentID: documentID,
                            title: 'Alamat',
                            value: 'alamat'),
                        SizedBox(height: 15.h),
                        CardData(
                            documentID: documentID,
                            title: 'Status Pekerjaan',
                            value: 'status_kerja'),
                        SizedBox(height: 15.h),
                        CardData(
                            documentID: documentID,
                            title: 'Pendidikan Terakhir',
                            value: 'pendidikan'),
                        SizedBox(height: 40.h),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CustomBottomNavBar(intPage: 3),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Container(
                            height: 50.h,
                            width: 270.w,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            decoration: BoxDecoration(
                              color: ColorApp.accentColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x4D000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 4),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.logout, size: 25.r),
                                const SizedBox(width: 18),
                                const Text(
                                  "Keluar",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/bottom_navigation/bottom_navigation.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  final CollectionReference _lowongan = FirebaseFirestore.instance
      .collection('users');

  final CollectionReference _lowonganLength = FirebaseFirestore.instance
      .collection('users');

  int index = 0;

  indexs() async {

    index = index;

    return StreamBuilder(
      stream: _lowongan.snapshots(),
      builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) {
        for (var i =0;i<snapshot.data!.docs.length; i++) {
          setState(() {
            index = i;
          });
        }
        return CircularProgressIndicator();
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20
            ),
            child: Column(
              children: [
                StreamBuilder(
                  stream: _lowongan.snapshots(),
                  builder: (context,  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if(streamSnapshot.hasData){
                      return Column(
                        children: [
                          card('User Name', streamSnapshot.data!.docs[index]['name']),
                          card('Email', streamSnapshot.data!.docs[index]['email']),
                          card('Nomor Hp', streamSnapshot.data!.docs[index]['nomor']),
                          card('Tanggal Lahir', streamSnapshot.data!.docs[index]['date']),
                          card('Alamat', streamSnapshot.data!.docs[index]['alamat']),
                          card('Setatus Pekerjaan', streamSnapshot.data!.docs[index]['status_kerja']),
                          card('Pendidikan Terakhir', streamSnapshot.data!.docs[index]['pendidikan']),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomBottomNavBar(intPage: 0),
                        ));
                  },
                  child: Container(
                    height: 50.h,
                    width: 270.w,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xffFF0000),
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
                          "Log Out",
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
      ),
    );
  }

  Widget card(String name, String value) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
                color: ColorApp.accentColor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 55,
            child: TextField(
              readOnly: true,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.black),
                hintText: value,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: ColorApp.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/widget/lowongan_card_horizontal.dart';
import 'package:lowongan_pekerjaan/ui/profil/pages/wishlist/not_login.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});
  static const isLogin = true;

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final CollectionReference _wishList = FirebaseFirestore.instance
      .collection('user_wistlist')
      .doc('FRtSiXkc7gu7EH1yQvy1')
      .collection(FirebaseAuth.instance.currentUser!.uid);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 10,
        toolbarHeight: 70.h,
        backgroundColor: ColorApp.secondaryColor,
      ),
      body: WishlistPage.isLogin
          ? StreamBuilder(
            stream: _wishList.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              int len = 0;
              if(streamSnapshot.data != null){
                len = streamSnapshot.data!.docs.length;
              }else{
                len = 0;
              }
              return ListView.builder(
                shrinkWrap: true,
                  itemCount: len,
                  padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documnentSnapshot =
                    streamSnapshot.data!.docs[index];
                    if(streamSnapshot.data == null){
                      return const Center(
                        child: Text(
                          'Tidak ada yang disimpan',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20
                          ),
                        ),
                      );
                    }
                    else {
                      return LowonganCardHorizontal(
                        isWishlistPage: true,
                        isNew: false,
                        lowonganName: documnentSnapshot['lowonganName'],
                        companyName: documnentSnapshot['companyName'],
                        locationCompany: documnentSnapshot['locationCompany'],
                        minimalEducationCompany: documnentSnapshot['minimalEducationCompany'],
                        professionCompany: documnentSnapshot['professionCompany'],
                        wagesCompany: documnentSnapshot['wagesCompany'],
                        ageRequiredCompany: documnentSnapshot['ageRequiredCompany'],
                        peopleRequired: documnentSnapshot['peopleRequired'],
                        experienceRequiredCompany: documnentSnapshot['experienceRequiredCompany'],
                        descriptionCompany: documnentSnapshot['descriptionCompany'],
                        aboutCompany: documnentSnapshot['aboutCompany'],
                        conditionCompany: documnentSnapshot['conditionCompany'],
                        descriptionJob: documnentSnapshot['descriptionJob'],
                        date: documnentSnapshot['date'],
                        isConfirm: documnentSnapshot['isConfirm'],);
                    }
                  },
                );
            }
          )
          : WishlistNotLoginPage(),
    );
  }
}

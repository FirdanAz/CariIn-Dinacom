import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class WishlistButton extends StatefulWidget {
  WishlistButton({
    super.key,
    required this.isDetailPage,
    required this.lowonganName,
    required this.companyName,
    required this.locationCompany,
    required this.minimalEducationCompany,
    required this.professionCompany,
    required this.wagesCompany,
    required this.ageRequiredCompany,
    required this.peopleRequired,
    required this.experienceRequiredCompany,
    required this.descriptionCompany,
    required this.aboutCompany,
    required this.conditionCompany,
    required this.descriptionJob,
    required this.date,
    required this.isConfirm,
    required this.isOn
  });
  final bool isDetailPage;
  String? lowonganName;
  String? companyName;
  String? locationCompany;
  String? minimalEducationCompany;
  String? professionCompany;
  int? wagesCompany;
  int? ageRequiredCompany;
  int? peopleRequired;
  String? experienceRequiredCompany;
  String? descriptionCompany;
  String? aboutCompany;
  String? conditionCompany;
  String? descriptionJob;
  String? date;
  bool? isConfirm;
  bool isOn;

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  CollectionReference _wishList = FirebaseFirestore.instance
      .collection('user_wistlist')
      .doc('FRtSiXkc7gu7EH1yQvy1')
      .collection(FirebaseAuth.instance.currentUser!.uid);

  Future createJobs() async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('user_wistlist')
        .doc('FRtSiXkc7gu7EH1yQvy1')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(widget.lowonganName);
    documentReference.set({
      'isConfirm': widget.isConfirm,
      'lowonganName': widget.lowonganName,
      'companyName': widget.companyName,
      'locationCompany': widget.locationCompany,
      'minimalEducationCompany': widget.minimalEducationCompany,
      'professionCompany': widget.professionCompany,
      'wagesCompany': widget.wagesCompany,
      'ageRequiredCompany': widget.ageRequiredCompany,
      'peopleRequired': widget.peopleRequired,
      'experienceRequiredCompany': widget.experienceRequiredCompany,
      'descriptionCompany': widget.descriptionCompany,
      'aboutCompany': widget.aboutCompany,
      'conditionCompany': widget.conditionCompany,
      'descriptionJob': widget.descriptionJob,
      'date': widget.date,
    });
    documentReference.update({
      'isConfirm': widget.isConfirm,
      'lowonganName': widget.lowonganName,
      'companyName': widget.companyName,
      'locationCompany': widget.locationCompany,
      'minimalEducationCompany': widget.minimalEducationCompany,
      'professionCompany': widget.professionCompany,
      'wagesCompany': widget.wagesCompany,
      'ageRequiredCompany': widget.ageRequiredCompany,
      'peopleRequired': widget.peopleRequired,
      'experienceRequiredCompany': widget.experienceRequiredCompany,
      'descriptionCompany': widget.descriptionCompany,
      'aboutCompany': widget.aboutCompany,
      'conditionCompany': widget.conditionCompany,
      'descriptionJob': widget.descriptionJob,
      'date': widget.date,
    });
  }

  // Menangani perubahan ketika tombol aktif atau tidak
  ScaffoldFeatureController _snackbar(BuildContext context) {
    if (widget.isOn) {
      createJobs();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorApp.secondaryColor,
          duration: const Duration(seconds: 1),
          content: Row(
            children: [
              Icon(Icons.bookmark, color: Colors.white, size: 20.w),
              SizedBox(width: 15.w),
              const Text("Ditambahkan ke Wishlist"),
            ],
          ),
        ),
      );
    }
    else {
      _wishList.doc(widget.lowonganName).delete();
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorApp.secondaryColor,
          duration: const Duration(seconds: 1),
          content: Row(
            children: [
              Icon(Icons.bookmark_outline, color: Colors.red, size: 20.w),
              SizedBox(width: 15.w),
              const Text("Dihapus dari Wishlist"),
            ],
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return widget.isDetailPage
        ? ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 40.h,
        width: 40.w,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              widget.isOn = !widget.isOn;
              _snackbar(context);
            });
          },
          style: ElevatedButton.styleFrom(
            primary: ColorApp.accentColor,
            alignment: Alignment.center,
            padding: EdgeInsets.all(0.w),
          ),
          child: Icon(
            widget.isOn ? Icons.bookmark : Icons.bookmark_outline,
            size: 24.w,
            // color: Colors.white,
          ),
        ),
      ),
    )
        : GestureDetector(
      onTap: () {
        setState(() {
          widget.isOn = !widget.isOn;
          _snackbar(context);
        });
      },
      child: Icon(
        widget.isOn ? Icons.bookmark : Icons.bookmark_outline,
        size: 24.w,
        color: ColorApp.primaryColor,
      ),
    );
  }
}
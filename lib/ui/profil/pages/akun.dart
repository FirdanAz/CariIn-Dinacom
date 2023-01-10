import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/bottom_navigation/bottom_navigation.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

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
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomBottomNavBar(intPage: 3),
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
    );
  }
}

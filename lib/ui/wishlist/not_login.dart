import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class WishlistNotLoginPage extends StatelessWidget {
  const WishlistNotLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Belum ada wishlist. Masuk untuk lihat dan\nsinkronasi wishlist anda",
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorApp.secondaryColor, fontSize: 11.sp),
          ),
          SizedBox(height: 23.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 40.h,
              width: 90.w,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.accentColor,
                ),
                child: Text(
                  "Login",
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
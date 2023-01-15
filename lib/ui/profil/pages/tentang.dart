import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/my_function.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff303841),
              Color.fromARGB(255, 0, 140, 147),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/tentang_logo.png',
              height: 60.h,
              width: 124.w,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(height: 15.h),
            Text("Versi 2.23.24.88", style: _textStyle(false)),
            SizedBox(height: 10.h),
            Text("2022-2023 NANO Developers.", style: _textStyle(false)),
            SizedBox(height: 15.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                width: 100.w,
                height: 35.h,
                child: ElevatedButton(
                  onPressed: () {
                    MyFunction().launchLink(Uri.parse(
                        'https://www.youtube.com/watch?v=xvFZjo5PgG0'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.accentColor,
                  ),
                  child: Text(
                    "Lisensi",
                    style: _textStyle(true),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle _textStyle(bool isButton) {
    return TextStyle(
      fontSize: isButton ? 12.sp : 10.sp,
      fontWeight: FontWeight.w500,
      color: isButton ? ColorApp.secondaryColor : Colors.white.withOpacity(0.6),
    );
  }
}

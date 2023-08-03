import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/search/search.dart';

class NoHaveProsesLamaran extends StatelessWidget {
  const NoHaveProsesLamaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          prosesLamaranLogo,
          height: 100.h,
          width: 100.w,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 25.h),
        Text(
          "Belum Ada Lamaran\nDiproses",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorApp.primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 15.h),
        Text(
          "Cari lowongan sekarang & mulai\nmelamar pekerjaan!",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorApp.primaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 25.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 40.h,
            width: 310.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: ColorApp.accentColor,
              ),
              child: Text(
                "Cari Lowongan Kerja",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}

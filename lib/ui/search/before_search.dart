import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lowongan_pekerjaan/common/color_app.dart';

class BeforeSearch extends StatelessWidget {
  const BeforeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riwayat",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0x803A4750)),
                ),
                SizedBox(height: 10.h),
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.history,
                          size: 20.w,
                          color: ColorApp.primaryColor,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "flutter development",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0x803A4750),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            ),
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kategori",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0x803A4750)),
                ),
                SizedBox(height: 10.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: [
                    _categoryButton("Akutansi dan Keuangan"),
                    _categoryButton("Customer Service"),
                    _categoryButton("Penjualan"),
                    _categoryButton("Logistik dan Kurir"),
                    _categoryButton("Pemasaran"),
                    _categoryButton("kesehatan, Salon, Kecantikan"),
                    _categoryButton("It dan Teknisi"),
                    _categoryButton("Tenaga Administrasi"),
                    _categoryButton("OB, Kebersihan dan Keamanan"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String text) {
    return ActionChip(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 11.h),
      backgroundColor: ColorApp.accentColor,
      labelPadding: EdgeInsets.zero,
      onPressed: () {},
      elevation: 10,
      pressElevation: 16,
      shadowColor: const Color(0x80AAAACC),
      label: Text(
        text,
        style: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
    // return Container(
    //   height: 40,
    //   width: 100,
    //   alignment: Alignment.center,
    //   padding: const EdgeInsets.symmetric(horizontal: 17),
    //   decoration: BoxDecoration(
    //     color: accentColor,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: MyText(
    //     text: text,
    //     size: 12,
    //     weight: FontWeight.w500,
    //     color: primaryColor,
    //   ),
    // );
  }
}

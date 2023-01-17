import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/not_login.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/proses_lamaran/no_have.dart';
import 'package:lowongan_pekerjaan/ui/widget/Pekerjaan_card.dart';

class HasilLamaranTab extends StatelessWidget {
  HasilLamaranTab({super.key});
  bool isHaveHasilLamaran = true;
  bool isHaveDiterima = true;
  bool isHaveDitolak = false;
  bool isHaveWawancara = true;

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null
        ? const PekerjaanNotLoginPage()
        : isHaveHasilLamaran
            ? SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorApp.accentColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: const Text(
                          "Diterima",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      isHaveDiterima
                          ? ListView.separated(
                              itemCount: 1,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              separatorBuilder: (context, index) => Divider(
                                height: 10.h,
                                color: Colors.transparent,
                              ),
                              itemBuilder: (context, index) {
                                return PekerjaanCard(status: "Diterima");
                              },
                            )
                          : _noHaveData(),
                      SizedBox(height: 25.h),

                      // Ditolak
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorApp.accentColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: const Text(
                          "Ditolak",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      isHaveDitolak
                          ? ListView.separated(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              separatorBuilder: (context, index) => Divider(
                                height: 10.h,
                                color: Colors.transparent,
                              ),
                              itemBuilder: (context, index) {
                                return PekerjaanCard(status: "Ditolak");
                              },
                            )
                          : _noHaveData(),
                      SizedBox(height: 25.h),

// Wawancara
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorApp.accentColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: const Text(
                          "Wawancara",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      isHaveWawancara
                          ? ListView.separated(
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              separatorBuilder: (context, index) => Divider(
                                height: 10.h,
                                color: Colors.transparent,
                              ),
                              itemBuilder: (context, index) {
                                return PekerjaanCard(
                                    status: "Undangan Wawancara");
                              },
                            )
                          : _noHaveData(),
                    ],
                  ),
                ),
              )
            : const NoHaveProsesLamaran();
  }

  Widget _noHaveData() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 3,
              )
            ]),
        child: Text(
          "Tidak ada Data",
          style: TextStyle(
            color: ColorApp.primaryColor,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}

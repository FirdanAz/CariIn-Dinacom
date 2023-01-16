import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class LamarPage extends StatelessWidget {
  const LamarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lamar Pekerjaan",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 10,
        toolbarHeight: 70.h,
        backgroundColor: ColorApp.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                Text("Kamu akan Melamar sebagai", style: _styleHeader(false)),
                Text("PT. Lintas Bumi", style: _styleHeader(true)),
                Text("sebagai", style: _styleHeader(false)),
                Text("penjelajah luar angkasa", style: _styleHeader(true)),
                SizedBox(height: 25.h),

                // Resume
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title("Resume", Icons.content_paste),
                    SizedBox(height: 5.h),
                    Text(
                      "Upload file dalam format PDF, maksimal 5MB. Upload sekali saja, kamu bisa pakai lagi di lamaran selanjutnya.",
                      style: _styleContent(),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),

                // Kontak
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title("Kontak", Icons.call),
                    SizedBox(height: 5.h),
                    Container(
                      height: 40.h,
                      width: 310.w,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: ColorApp.accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Nomor HP",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Perusahaan memerlukan informasi ini untuk menghubungimu lebih cepat.",
                      style: _styleContent(),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),

                // Surat Lamaran
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title("Surat Lamaran", Icons.create),
                    SizedBox(height: 5.h),
                    Container(
                      width: 310.w,
                      constraints: BoxConstraints(minHeight: 100.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: ColorApp.accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Tulis surat lamaran anda..",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Ceritakan mengapa kamu ingin melamar pekerjaan di perusahaan ini.",
                      style: _styleContent(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.25)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 40.h,
              width: 268.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LamarPage()));
                },
                style: ElevatedButton.styleFrom(primary: ColorApp.accentColor),
                child: Text(
                  "LAMAR SEKARANG",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _styleHeader(bool isImportant) {
    return TextStyle(
      fontSize: 13.sp,
      color: ColorApp.primaryColor,
      fontWeight: isImportant ? FontWeight.w600 : FontWeight.w500,
    );
  }

  TextStyle _styleContent() {
    return TextStyle(
      fontSize: 10.sp,
      color: ColorApp.accentColor,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _title(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18.w, color: ColorApp.primaryColor),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: ColorApp.accentColor,
          ),
        )
      ],
    );
  }
}

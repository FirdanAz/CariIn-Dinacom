import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/kotak_masuk/not_login.dart';

class KotakMasukPage extends StatelessWidget {
  const KotakMasukPage({super.key});

  static const isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kotak Masuk",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 25,
        toolbarHeight: 70.h,
        backgroundColor: ColorApp.primaryColor,
      ),
      body: FirebaseAuth.instance.currentUser == null
          ? const KotakMasukNotLoginPage()
          : ListView.separated(
              itemCount: 5,
              padding: EdgeInsets.all(25.w),
              separatorBuilder: (context, index) => Divider(
                height: 15.h,
                color: Colors.transparent,
              ),
              itemBuilder: (context, index) {
                return _notifCard();
              },
            ),
    );
  }

  Widget _notifCard() {
    return Container(
      width: 310.w,
      padding:
          EdgeInsets.only(left: 10.w, right: 25.w, top: 15.h, bottom: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 235.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lorem Ipsum Dolor amet",
                  style: TextStyle(
                    color: ColorApp.accentColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad",
                  style: TextStyle(
                    color: ColorApp.primaryColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Text(
                      "19 Agustus 2023",
                      style: TextStyle(
                        color: ColorApp.secondaryColor.withOpacity(0.5),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "13.08",
                      style: TextStyle(
                        color: ColorApp.secondaryColor.withOpacity(0.5),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

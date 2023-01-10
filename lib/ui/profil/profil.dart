import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/login_page.dart';
import 'package:lowongan_pekerjaan/ui/bottom_navigation/bottom_navigation.dart';
import 'package:lowongan_pekerjaan/ui/not_user/not_user_login.dart';
import 'package:lowongan_pekerjaan/ui/wishlist/wishlist.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FirebaseAuth.instance.currentUser == null
        ? NotUserLogin()
        : Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: screenSize.height / 2,
                    color: ColorApp.primaryColor,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 161),
                    padding: EdgeInsets.only(
                      top: 72.h,
                      bottom: 75,
                    ),
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "PROJEK 2M",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorApp.primaryColor),
                        ),
                        SizedBox(height: 13.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.2.h, horizontal: 17.w),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "DinacomFest@gmail.com",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ColorApp.primaryColor),
                          ),
                        ),
                        SizedBox(height: 44.h),
                        button(context, Icons.account_circle, "Account", () {}),
                        const SizedBox(height: 18),
                        button(context, Icons.bookmark, "Wishlist", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WishlistPage()));
                        }),
                        const SizedBox(height: 18),
                        button(context, Icons.design_services, "Pusat Bantuan",
                            () {}),
                        const SizedBox(height: 18),
                        button(context, Icons.info, "About", () {}),
                        const SizedBox(height: 18),
                        button(context, Icons.logout, "Log Out", () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CustomBottomNavBar(intPage: 3),
                              ));
                        }),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 96,
                    left: (screenSize.width - 130.h) / 2,
                    child: Container(
                      width: 130.h,
                      height: 130.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: ColorApp.primaryColor, width: 5.w),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/foto_profil.jpg",
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: -4,
                            child: Container(
                              width: 35.h,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: ColorApp.primaryColor, width: 3.w),
                              ),
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 16,
                                color: ColorApp.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Widget button(
      BuildContext context, IconData icon, String text, Function()? function) {
    bool isLogOut = text == "Log Out";
    return InkWell(
      onTap: function,
      child: Container(
        height: 50.h,
        width: 270.w,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: isLogOut ? const Color(0xffFF0000) : ColorApp.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0x4D000000), offset: Offset(0, 3), blurRadius: 4),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 25.r, color: Colors.white),
            const SizedBox(width: 18),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Spacer(),
            Icon(isLogOut ? null : Icons.arrow_forward, size: 25)
          ],
        ),
      ),
    );
  }
}

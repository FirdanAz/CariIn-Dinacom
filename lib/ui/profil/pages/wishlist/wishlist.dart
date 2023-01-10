import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/widget/lowongan_card_horizontal.dart';
import 'package:lowongan_pekerjaan/ui/profil/pages/wishlist/not_login.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});
  static const isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 10,
        toolbarHeight: 70.h,
        backgroundColor: ColorApp.secondaryColor,
      ),
      body: isLogin
          ? ListView.separated(
              itemCount: 5,
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
              separatorBuilder: (context, index) => Divider(
                height: 15.h,
                color: Colors.transparent,
              ),
              itemBuilder: (context, index) {
                return LowonganCardHorizontal(
                  isWishlistPage: true,
                  isNew: false,
                  name: "Mobile front End",
                );
              },
            )
          : WishlistNotLoginPage(),
    );
  }
}

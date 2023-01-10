import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/detail/detail.dart';
import 'package:lowongan_pekerjaan/ui/widget/wishlist_button.dart';

class LowonganCardHorizontal extends StatelessWidget {
  LowonganCardHorizontal({
    super.key,
    required this.isWishlistPage,
    required this.isNew,
    required this.name,
  });
  final String name;
  double? _heightBetween;
  final bool isNew;

  // TODO: ubah 'True' hanya jika berada di halaman Wishlist
  final bool isWishlistPage;

  Widget _rightTopCornerWidget() {
    if (isNew) {
      _heightBetween = 82.h;
      return Container(
        width: 60.w,
        height: 17.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorApp.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
        ),
        child: Text(
          'New',
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        ),
      );
    } else if (isWishlistPage) {
      _heightBetween = 60.h;
      return Padding(
        padding: EdgeInsets.only(right: 13.w),
        child: WishlistButton(),
      );
    } else {
      _heightBetween = 82.h;
      return SizedBox(height: 17.h);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Ink(
          color: Colors.white,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 15.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png',
                  fit: BoxFit.fill,
                  height: 60,
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: ColorApp.accentColor),
                  ),
                  Text(
                    'PT. Nano Group',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: ColorApp.primaryColor),
                  ),
                  Text(
                    'Kab. Kudus, Jawa Tengah',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorApp.secondaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'SMA/SMK',
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: ColorApp.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Full-time, On-site',
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: ColorApp.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dibutuhkan Segera',
                        style: TextStyle(
                            color: ColorApp.accentColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '5 orang dibutuhkan',
                        style: TextStyle(
                            color: ColorApp.accentColor, fontSize: 10.sp),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _rightTopCornerWidget(),
                  SizedBox(height: _heightBetween),
                  Padding(
                    padding: EdgeInsets.only(right: 13.w),
                    child: Text(
                      '1 Hari yang lalu',
                      style: TextStyle(
                          color: ColorApp.secondaryColor.withOpacity(0.5),
                          fontSize: 8.sp),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/detail/detail.dart';

class LowonganCardHorizontal extends StatelessWidget {
  const LowonganCardHorizontal({super.key});

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
          // alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png',
                          fit: BoxFit.fill,
                          height: 60,
                        )),
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile Front end',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                      color: ColorApp.accentColor,
                                      fontSize: 10.sp),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                '1 Hari yang lalu',
                                style: TextStyle(
                                    color: ColorApp.secondaryColor
                                        .withOpacity(0.5),
                                    fontSize: 8.sp),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: Container(
                  width: 56,
                  alignment: Alignment.center,
                  color: ColorApp.secondaryColor,
                  margin: EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'New',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

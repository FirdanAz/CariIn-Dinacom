import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class PekerjaanCard extends StatelessWidget {
  const PekerjaanCard({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10.r),
      child: Ink(
        width: double.infinity,
        height: 110.h,
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 3,
              // offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png',
                fit: BoxFit.cover,
                height: 50.h,
              ),
            ),
            SizedBox(width: 15.w),
            SizedBox(
              width: 210.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mobile Development",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: ColorApp.accentColor),
                  ),
                  Text(
                    "PT. Nano group",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: ColorApp.primaryColor),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.verified,
                          size: 12, color: ColorApp.accentColor),
                      SizedBox(width: 3.5.w),
                      Text(
                        status,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: ColorApp.accentColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Dilamar pada 13 Aplir 2018",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 8.sp,
                      color: ColorApp.secondaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

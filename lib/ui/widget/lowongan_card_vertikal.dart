import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/ui/detail/detail.dart';

import '../../common/color_app.dart';

class LowonganCardVertikal extends StatelessWidget {
  String? id;
  String? name;
  String? ptName;
  String? ptLocation;
  String? profession;
  String? division;
  String? experience;
  String? times;
  int? people;
  String? wages;
  LowonganCardVertikal(
      {Key? key,
      required this.id,
      required this.name,
      required this.ptName,
      required this.ptLocation,
      required this.profession,
      required this.division,
      required this.experience,
      required this.times,
      required this.people,
      required this.wages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Ink(
          width: 250.w,
          // height: 400,
          padding:
              EdgeInsets.only(top: 15.h, left: 15.w, bottom: 9.h, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 35.h,
                  child: CircleAvatar(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(1000)),
                        child: Image.network(
                          'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png',
                          fit: BoxFit.fill,
                        )),
                  )),
              SizedBox(height: 10.h),
              Text(
                name.toString(),
                style: TextStyle(
                    color: ColorApp.accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp),
              ),
              SizedBox(height: 5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_city_sharp,
                      size: 15.w, color: ColorApp.primaryColor),
                  SizedBox(width: 10.w),
                  Text(
                    ptName.toString(),
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorApp.primaryColor),
                  )
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                ptLocation.toString(),
                style: TextStyle(
                    fontSize: 10.sp,
                    color: ColorApp.secondaryColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Icon(Icons.school_outlined,
                      size: 15.w, color: ColorApp.primaryColor),
                  SizedBox(width: 10.w),
                  Text(
                    experience.toString(),
                    style: TextStyle(
                        fontSize: 10.sp, color: ColorApp.primaryColor),
                  )
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Icon(Icons.work_outline,
                      size: 15.w, color: ColorApp.primaryColor),
                  SizedBox(width: 10.w),
                  Text(
                    profession.toString(),
                    style: TextStyle(
                        fontSize: 10.sp, color: ColorApp.primaryColor),
                  )
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Icon(Icons.money, size: 15.w, color: ColorApp.primaryColor),
                  SizedBox(width: 10.w),
                  Text(
                    wages.toString(),
                    style: TextStyle(
                        fontSize: 10.sp, color: ColorApp.primaryColor),
                  )
                ],
              ),
              SizedBox(height: 10.h),
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
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${people} orang dibutuhkan',
                        style: TextStyle(
                            color: ColorApp.accentColor, fontSize: 11.sp),
                      )
                    ],
                  ),
                  Text(
                    times.toString(),
                    style: TextStyle(
                        color: ColorApp.secondaryColor.withOpacity(0.5),
                        fontSize: 10.sp),
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

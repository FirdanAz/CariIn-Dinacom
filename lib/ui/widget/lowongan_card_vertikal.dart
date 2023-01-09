import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
  LowonganCardVertikal({Key? key, required this.id, required this.name, required this.ptName, required this.ptLocation, required this.profession, required this.division, required this.experience, required this.times, required this.people,  required this.wages}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 250.w,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 35,
                        child: CircleAvatar(
                          child: ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(1000)),
                              child: Image.network(
                                'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png',
                                fit: BoxFit.fill,
                              )),
                        )),
                    SizedBox(height: 10),
                    Text(
                      name.toString(),
                      style: GoogleFonts.poppins(
                          color: ColorApp.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_city_sharp,
                            size: 15, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          ptName.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: ColorApp.primaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      ptLocation.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 11, color: Colors.black45),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.school_outlined,
                            size: 15, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          experience.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 11, color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.work_outline,
                            size: 15, color: ColorApp.primaryColor),
                        SizedBox(width: 10),
                        Text(
                          profession.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 11, color: ColorApp.primaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.money,
                            size: 15, color: ColorApp.primaryColor),
                        SizedBox(width: 10),
                        Text(
                          wages.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 11, color: ColorApp.primaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dibutuhkan Segera',
                              style: GoogleFonts.poppins(
                                  color: ColorApp.accentColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${people} orang dibutuhkan',
                              style: GoogleFonts.poppins(
                                  color: ColorApp.accentColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Text(
                          times.toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.black45, fontSize: 11),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}

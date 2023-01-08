import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/widget/home_header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cvCheck = 4;
  final _lowonganCardHorizonLenght = 3;
  final CollectionReference _lowongan = 
      FirebaseFirestore.instance.collection('category').doc('dvPSUvsmmKov6aHRDbhf').collection('programmer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorApp.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.primaryColor,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 8),
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          )
        ],
        title: Container(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(appbar_logo, height: 30, width: 63),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: 93,
              backgroundColor: ColorApp.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: ColorApp.primaryColor,
                  padding: EdgeInsets.only(top: 10, left: 25, right: 125.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Selamat Pagi Nano!",
                        style: TextStyle(
                            color: Color(0xB3ffffff),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Temukan Lowongan Pekerjaan Anda",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(pinned: true, delegate: HomeHeader()),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  cvCard(),
                  SizedBox(height: 25.h),
                  textData('Berdasarkan Profilmu', true),
                  SizedBox(height: 25.h),
                  SizedBox(
                    height: 270.h,
                    child: ScrollConfiguration(
                      behavior: const MaterialScrollBehavior()
                          .copyWith(overscroll: false),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _lowonganCardHorizonLenght,
                        padding: EdgeInsets.symmetric(horizontal: 23.w),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index < _lowonganCardHorizonLenght - 1
                                  ? 30
                                  : 0,
                            ),
                            child: lowonganCardHorizon(),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  textData('Pekerjaan Baru', false),
                  SizedBox(height: 25.h),
                  // ListView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: 3,
                  //   itemBuilder: (context, index) {
                  //     return lowonganCardVertikal();
                  //   },
                  // ),
                  StreamBuilder(
                    stream: _lowongan.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if(streamSnapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documnentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return lowonganCardVertikal(documnentSnapshot['name']);
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textData(String text, bool isMore) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
                color: ColorApp.primaryColor, fontWeight: FontWeight.w600),
          ),
          isMore
              ? Text(
                  'Lihat semua',
                  style: GoogleFonts.poppins(
                      color: ColorApp.accentColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                )
              : Container()
        ],
      ),
    );
  }

  Widget cvCard() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 106.h,
      width: 310.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorApp.accentColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(cv_logo),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lengkapi Data CV mu",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 173.w,
                child: Text(
                  "Dapatkan rekomendasi pekerjaan sesuai Kartu CV mu!",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  for (int i = 1; i <= 6; i++)
                    Container(
                      height: 4,
                      width: 20,
                      margin: EdgeInsets.only(right: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: i <= cvCheck
                              ? ColorApp.secondaryColor
                              : const Color(0x4d3A4750)),
                    ),
                  SizedBox(width: 5.w),
                  Text(
                    "$cvCheck Dari 6",
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: ColorApp.primaryColor),
        ],
      ),
    );
  }

  Widget lowonganCardHorizon() {
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
                      'Mobile Front End',
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
                          'PT. Nano Group',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: ColorApp.primaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Kab. Kudus, Jawa Tengah',
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
                          'SMA/SMK',
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
                          'Full-Time,On-Site',
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
                          'Rp 3.000.000 - Rp 4.000.000',
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
                              '5 orang dibutuhkan',
                              style: GoogleFonts.poppins(
                                  color: ColorApp.accentColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Text(
                          '1 Hari yang lalu',
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
    );
  }

  Widget lowonganCardVertikal(String name) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8, bottom: 20),
      child: Card(
        child: Container(
          color: Colors.white,
          width: double.maxFinite,
          alignment: Alignment.centerLeft,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: ColorApp.accentColor),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'PT. Nano Group',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: ColorApp.primaryColor),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Kab. Kudus, Jawa Tengah',
                          style: GoogleFonts.poppins(
                              fontSize: 11, color: Colors.black45),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'SMA/SMK',
                          style: GoogleFonts.poppins(
                              fontSize: 11, color: ColorApp.primaryColor),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Full-time, On-site',
                          style: GoogleFonts.poppins(
                              fontSize: 11, color: ColorApp.primaryColor),
                        ),
                        SizedBox(height: 6),
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
                                  '5 orang dibutuhkan',
                                  style: GoogleFonts.poppins(
                                      color: ColorApp.accentColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                '1 Hari yang lalu',
                                style: GoogleFonts.poppins(
                                    color: Colors.black45, fontSize: 11),
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
                      style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w600),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/widget/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorApp.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.secondaryColor,
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            expandedHeight: 93,
            backgroundColor: ColorApp.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Padding(
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
                const SizedBox(height: 25),
                cvCard(),
                lowonganCard()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cvCard() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 100,
      width: 310.w,
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
    );
  }

  Widget lowonganCard() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      width: 310.w,
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
                        child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(1000)) ,child: Image.network('https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png', fit: BoxFit.fill,)),
                      )
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Mobile Front End',
                      style: GoogleFonts.poppins(
                          color: ColorApp.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_city_sharp,
                          size: 15,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'PT. Nano Group',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Kab. Kudus, Jawa Tengah',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.black45
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.school_outlined,
                          size: 15,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'SMA/SMK',
                          style: GoogleFonts.poppins(
                            fontSize: 11
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 15,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Full-Time,On-Site',
                          style: GoogleFonts.poppins(
                              fontSize: 11
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(
                          Icons.money,
                          size: 15,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'Rp 3.000.000 - Rp 4.000.000',
                          style: GoogleFonts.poppins(
                              fontSize: 11
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(
                              '5 orang dibutuhkan',
                              style: GoogleFonts.poppins(
                                  color: ColorApp.accentColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                        Text(
                          '1 Hari yang lalu',
                          style: GoogleFonts.poppins(
                            color: Colors.black45,
                            fontSize: 11
                          ),
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
}

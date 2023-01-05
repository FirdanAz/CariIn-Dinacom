import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/widget/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cvCheck = 4;

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
                const SizedBox(height: 800),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cvCard() {
    return Container(
      height: 100,
      width: 310.w,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lengkapi Data CV mu",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 173.w,
                child: const Text(
                  "Dapatkan rekomendasi pekerjaan sesuai Kartu CV mu!",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  for (int i = 1; i <= 6; i++)
                    Container(
                      height: 4,
                      width: 20,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: i <= cvCheck
                              ? ColorApp.secondaryColor
                              : const Color(0x4d3A4750)),
                    ),
                  SizedBox(width: 5.w),
                  Text(
                    "$cvCheck Dari 6",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
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
}

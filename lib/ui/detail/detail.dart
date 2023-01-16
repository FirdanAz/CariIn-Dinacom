import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/widget/wishlist_button.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  static const bool isNewJob = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorApp.accentColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Detail Lowongan",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            titleSpacing: 10,
            toolbarHeight: 70.h,
            backgroundColor: ColorApp.secondaryColor,
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Head
                Container(
                  width: screenSize.width,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 25.w, right: 15.w),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          'https://winaero.com/blog/wp-content/uploads/2018/08/Windows-10-user-icon-big.png',
                          fit: BoxFit.fill,
                          height: 53.w,
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170.w,
                            child: Text(
                              "Mobile Front End",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorApp.accentColor),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "PT. Nano Group",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    ColorApp.secondaryColor.withOpacity(0.5)),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "Kab. Kudus, Jawa Tengah",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    ColorApp.secondaryColor.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      isNewJob
                          ? RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                height: 20.h,
                                width: 103.w,
                                color: ColorApp.primaryColor,
                                alignment: Alignment.center,
                                child: Text(
                                  "Pekerjaan Terbaru",
                                  style: TextStyle(fontSize: 9.sp),
                                ),
                              ),
                            )
                          : SizedBox(height: 103.w),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),

                // Ringkasan
                Container(
                  width: screenSize.width,
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                  child: Column(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.history,
                                  size: 18.w, color: ColorApp.primaryColor),
                              SizedBox(width: 5.w),
                              Text(
                                "Full-time, On-site",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorApp.primaryColor),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),

                // Informasi Detail
                Container(
                  width: screenSize.width,
                  color: Colors.white,
                  padding: EdgeInsets.all(25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleText("Deskripsi Lowongan"),
                      SizedBox(height: 10.h),
                      _contentText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim."),
                      SizedBox(height: 10.h),
                      _titleText("Tentang Kami"),
                      SizedBox(height: 10.h),
                      _contentText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim."),
                      SizedBox(height: 10.h),
                      _titleText("Syarat Pekerjaan"),
                      SizedBox(height: 10.h),
                      _contentText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim."),
                      SizedBox(height: 10.h),
                      _titleText("Deskripsi Pekerjaan"),
                      SizedBox(height: 10.h),
                      _contentText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim."),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),

                // Skil
                Container(
                  width: screenSize.width,
                  color: Colors.white,
                  padding: EdgeInsets.all(25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleText("Skill Yang Harus Dimiliki"),
                      SizedBox(height: 15.h),
                      Wrap(
                        spacing: 15,
                        runSpacing: 10,
                        children: [
                          _skilCard("Java"),
                          _skilCard("Hacking"),
                          _skilCard("Mobile Legend"),
                          _skilCard("Hyper Text Markup Language"),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.25)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 40.h,
                  width: 268.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.accentColor),
                    child: Text(
                      "LAMAR",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              const WishlistButton(isDetailPage: true),
            ],
          ),
        ),
      ),
    );
  }

  Text _titleText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: ColorApp.secondaryColor,
      ),
    );
  }

  Text _contentText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorApp.secondaryColor,
      ),
    );
  }

  Widget _skilCard(String skilName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 11.h),
      decoration: BoxDecoration(
        color: ColorApp.accentColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        skilName,
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}

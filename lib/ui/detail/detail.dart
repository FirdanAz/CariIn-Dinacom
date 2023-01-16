import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/detail/lamar.dart';
import 'package:lowongan_pekerjaan/ui/widget/wishlist_button.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  DetailPage({
    required this.lowonganName,
    required this.companyName,
    required this.locationCompany,
    required this.minimalEducationCompany,
    required this.professionCompany,
    required this.wagesCompany,
    required this.ageRequiredCompany,
    required this.peopleRequired,
    required this.experienceRequiredCompany,
    required this.descriptionCompany,
    required this.aboutCompany,
    required this.conditionCompany,
    required this.descriptionJob,
    required this.date,
});
    String? lowonganName;
    String? companyName;
    String? locationCompany;
    String? minimalEducationCompany;
    String? professionCompany;
    String? wagesCompany;
    int? ageRequiredCompany;
    int? peopleRequired;
    String? experienceRequiredCompany;
    String? descriptionCompany;
    String? aboutCompany;
    String? conditionCompany;
    String? descriptionJob;
    String? date;
    static const bool isNewJob = true;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CollectionReference _lowongan = FirebaseFirestore.instance.collection('admin').doc('Z1u1IE4vrZpjXGCPsGJs').collection('allData');
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorApp.accentColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
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
                              widget.lowonganName.toString(),
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorApp.accentColor),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            widget.companyName.toString(),
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                ColorApp.secondaryColor.withOpacity(0.5)),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            widget.locationCompany.toString(),
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                ColorApp.secondaryColor.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      const Spacer(),
                      DetailPage.isNewJob
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
                      _summaryCard(Icons.school_outlined, widget.minimalEducationCompany.toString()),
                      _summaryCard(Icons.work_outline, widget.professionCompany.toString()),
                      _summaryCard(Icons.workspace_premium, widget.experienceRequiredCompany.toString()),
                      _summaryCard(Icons.location_city, widget.locationCompany.toString()),
                      _summaryCard(Icons.date_range, widget.date.toString()),
                      _summaryCard(Icons.money, widget.wagesCompany.toString()),
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
                      _contentText(widget.descriptionCompany.toString()),
                      SizedBox(height: 10.h),
                      _titleText("Tentang Kami"),
                      SizedBox(height: 10.h),
                      _contentText(widget.aboutCompany.toString()),
                      SizedBox(height: 10.h),
                      _titleText("Syarat Pekerjaan"),
                      SizedBox(height: 10.h),
                      _contentText(widget.conditionCompany.toString()),
                      SizedBox(height: 10.h),
                      _titleText("Deskripsi Pekerjaan"),
                      SizedBox(height: 10.h),
                      _contentText(widget.descriptionJob.toString()),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 380),
                          child: LamarPage(),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(primary: ColorApp.accentColor),
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

  Widget _summaryCard(IconData icons, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icons,
              size: 18.w, color: ColorApp.primaryColor),
          SizedBox(width: 5.w),
          Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                color: ColorApp.primaryColor),
          )
        ],
      ),
    );
  }
}

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
  double? _heightBetween;
  bool isWishlistOn = false;
  final bool isNew;
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
        child: GestureDetector(
          onTap: () => isWishlistOn = !isWishlistOn,
          child: const WishlistButton(
            isDetailPage: false,
          ),
        ),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(lowonganName: lowonganName, companyName: companyName, locationCompany: locationCompany, minimalEducationCompany: minimalEducationCompany, professionCompany: professionCompany, wagesCompany: wagesCompany, ageRequiredCompany: ageRequiredCompany, peopleRequired: peopleRequired, experienceRequiredCompany: experienceRequiredCompany, descriptionCompany: descriptionCompany, aboutCompany: aboutCompany, conditionCompany: conditionCompany, descriptionJob: descriptionJob, date: date),));
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
                    lowonganName.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: ColorApp.accentColor),
                  ),
                  Text(
                    companyName.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: ColorApp.primaryColor),
                  ),
                  Text(
                    locationCompany.toString(),
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorApp.secondaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    minimalEducationCompany.toString(),
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: ColorApp.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    professionCompany.toString(),
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
                        '${peopleRequired} orang dibutuhkan',
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
                      date.toString(),
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
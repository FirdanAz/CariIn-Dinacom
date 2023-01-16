import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/widget/home_header.dart';
import 'package:lowongan_pekerjaan/ui/widget/lowongan_card_horizontal.dart';
import 'package:lowongan_pekerjaan/ui/widget/lowongan_card_vertikal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cvCheck = 2;
  final CollectionReference _lowongan = FirebaseFirestore.instance
      .collection('admin')
      .doc('Z1u1IE4vrZpjXGCPsGJs')
      .collection('allData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorApp.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.primaryColor,
        title: Container(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(appbarLogo, height: 30, width: 63),
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
                      child: StreamBuilder(
                        stream: _lowongan
                            .where("isConfirm", isEqualTo: true)
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (streamSnapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: streamSnapshot.data!.docs.length,
                              padding: EdgeInsets.symmetric(horizontal: 23.w),
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documnentSnapshot =
                                streamSnapshot.data!.docs[index];
                                //rupiah
                                final formartter = NumberFormat.simpleCurrency(
                                    locale: 'id_ID');
                                var nilai = documnentSnapshot['wagesCompany'];
                                var rupiah = formartter.format(nilai);
                                return LowonganCardVertikal(
                                  lowonganName: documnentSnapshot['lowonganName'],
                                  companyName: documnentSnapshot['companyName'],
                                  locationCompany: documnentSnapshot['locationCompany'],
                                  minimalEducationCompany: documnentSnapshot['minimalEducationCompany'],
                                  professionCompany: documnentSnapshot['professionCompany'],
                                  wagesCompany: documnentSnapshot['wagesCompany'],
                                  ageRequiredCompany: documnentSnapshot['ageRequiredCompany'],
                                  peopleRequired: documnentSnapshot['peopleRequired'],
                                  experienceRequiredCompany: documnentSnapshot['experienceRequiredCompany'],
                                  descriptionCompany: documnentSnapshot['descriptionCompany'],
                                  aboutCompany: documnentSnapshot['aboutCompany'],
                                  conditionCompany: documnentSnapshot['conditionCompany'],
                                  descriptionJob: documnentSnapshot['descriptionJob'],
                                  date: documnentSnapshot['date'],
                                  isConfirm: documnentSnapshot['isConfirm'],
                                );
                              });
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  textData('Pekerjaan Baru', false),
                  SizedBox(height: 17.h),
                  StreamBuilder(
                    stream: _lowongan.where('isConfirm' , isEqualTo: true).snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          separatorBuilder: (context, index) => Divider(
                            height: 8.h,
                            color: Colors.transparent,
                          ),
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documnentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return LowonganCardHorizontal(
                              isWishlistPage: false,
                              isNew: true,
                              lowonganName: documnentSnapshot['lowonganName'],
                              companyName: documnentSnapshot['companyName'],
                              locationCompany: documnentSnapshot['locationCompany'],
                              minimalEducationCompany: documnentSnapshot['minimalEducationCompany'],
                              professionCompany: documnentSnapshot['professionCompany'],
                              wagesCompany: documnentSnapshot['wagesCompany'],
                              ageRequiredCompany: documnentSnapshot['ageRequiredCompany'],
                              peopleRequired: documnentSnapshot['peopleRequired'],
                              experienceRequiredCompany: documnentSnapshot['experienceRequiredCompany'],
                              descriptionCompany: documnentSnapshot['descriptionCompany'],
                              aboutCompany: documnentSnapshot['aboutCompany'],
                              conditionCompany: documnentSnapshot['conditionCompany'],
                              descriptionJob: documnentSnapshot['descriptionJob'],
                              date: documnentSnapshot['date'],
                              isConfirm: documnentSnapshot['isConfirm'],
                            );
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
            style: const TextStyle(
                color: ColorApp.primaryColor, fontWeight: FontWeight.w600),
          ),
          isMore
              ? const Text(
                  'Lihat semua',
                  style: TextStyle(
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
          SvgPicture.asset(cvLogo),
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
}

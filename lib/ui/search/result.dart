import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/search/search.dart';
import 'package:lowongan_pekerjaan/ui/widget/lowongan_card_horizontal.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key, required this.searchText});
  final String searchText;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final CollectionReference _lowonganAdminstrasi = FirebaseFirestore.instance
      .collection('category')
      .doc('dvPSUvsmmKov6aHRDbhf')
      .collection('administrasi');

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ColorApp.primaryColor,
        title: Container(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(appbarLogo, height: 30, width: 63),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(screenSize.width, 70.h),
          child: _searchWidget(),
        ),
      ),
      body: StreamBuilder(
        stream: _lowonganAdminstrasi.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: streamSnapshot.data!.docs.length,
              separatorBuilder: (context, index) => Divider(
                height: 15.h,
                color: Colors.transparent,
              ),
              itemBuilder: (context, index) {
                final DocumentSnapshot documnentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Text(
                  "data $index",
                  style: TextStyle(color: Colors.black),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _searchWidget() {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 15),
      decoration: const BoxDecoration(
        color: ColorApp.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SearchPage()));
        },
        child: Container(
          height: 40,
          width: 310.w,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(Icons.search, size: 20.w, color: ColorApp.primaryColor),
              SizedBox(
                width: 5.w,
              ),
              Text(
                widget.searchText,
                style:
                    const TextStyle(fontSize: 13, color: ColorApp.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

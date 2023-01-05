import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  double maxHeight = 87;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxHeight,
      padding: const EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 5),
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
      child: Column(
        children: [
          Container(
            height: 40,
            width: 310.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Icon(Icons.search, size: 20.w, color: const Color(0x99303841)),
                SizedBox(
                  width: 5.w,
                ),
                const Text(
                  "Cari loker atau perushaan",
                  style: TextStyle(fontSize: 13, color: Color(0x99303841)),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 2,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

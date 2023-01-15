import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class WishlistButton extends StatefulWidget {
  const WishlistButton({super.key, required this.isDetailPage});
  final bool isDetailPage;

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return widget.isDetailPage
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 40.h,
              width: 40.w,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isOn = !isOn;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorApp.accentColor,
                  foregroundColor: Colors.white,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(0.w),
                ),
                child: Icon(
                  isOn ? Icons.bookmark : Icons.bookmark_outline,
                  size: 24.w,
                  // color: Colors.white,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                isOn = !isOn;
              });
            },
            child: Icon(
              isOn ? Icons.bookmark : Icons.bookmark_outline,
              size: 24.w,
              color: ColorApp.primaryColor,
            ),
          );
  }
}

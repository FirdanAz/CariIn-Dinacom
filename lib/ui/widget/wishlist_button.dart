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

  // Menangani perubahan ketika tombol aktif atau tidak
  ScaffoldFeatureController _snackbar(BuildContext context) {
    if (isOn) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorApp.secondaryColor,
          duration: const Duration(seconds: 1),
          content: Row(
            children: [
              Icon(Icons.bookmark, color: Colors.white, size: 20.w),
              SizedBox(width: 15.w),
              const Text("Ditambahkan ke Wishlist"),
            ],
          ),
        ),
      );
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorApp.secondaryColor,
          duration: const Duration(seconds: 1),
          content: Row(
            children: [
              Icon(Icons.bookmark_outline, color: Colors.red, size: 20.w),
              SizedBox(width: 15.w),
              const Text("Dihapus dari Wishlist"),
            ],
          ),
        ),
      );
    }
  }

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
                    _snackbar(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorApp.accentColor,
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
                _snackbar(context);
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

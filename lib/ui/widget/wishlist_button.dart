import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class WishlistButton extends StatefulWidget {
  const WishlistButton({super.key});

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isOn = !isOn;
        });
      },
      icon: Icon(
        isOn ? Icons.bookmark : Icons.bookmark_outline,
        size: 24.w,
        color: ColorApp.primaryColor,
      ),
    );
  }
}

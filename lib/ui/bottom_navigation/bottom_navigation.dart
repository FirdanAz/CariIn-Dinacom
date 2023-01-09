import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/home/home.dart';
import 'package:lowongan_pekerjaan/ui/not_user/not_user_login.dart';
import 'package:lowongan_pekerjaan/ui/kotak_masuk/kotak_masuk.dart';
import 'package:lowongan_pekerjaan/ui/profil/profil.dart';
import 'package:lowongan_pekerjaan/ui/widget/navbar_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({super.key, required this.intPage});
  int intPage;

  @override
  State<CustomBottomNavBar> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  double _tabPositionLeft = 11.w;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onChangedTab(widget.intPage);
  }

  void onChangedTab(int index) {
    setState(() {
      widget.intPage = index;
    });
    if (widget.intPage == 1) {
      setState(() {
        _tabPositionLeft = 97.w;
      });
    } else if (widget.intPage == 2) {
      setState(() {
        _tabPositionLeft = 183.w;
      });
    } else if (widget.intPage == 3) {
      setState(() {
        _tabPositionLeft = 269.w;
      });
    } else {
      setState(() {
        _tabPositionLeft = 11.w;
      });
    }
  }

  final pages = const [
    HomePage(),
    Center(child: Text("Halaman 2", style: TextStyle(color: Colors.black))),
    KotakMasukPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.intPage = widget.intPage;
    });
    return Scaffold(
      body: pages[widget.intPage],
      bottomNavigationBar: BottomAppBar(
        // elevation: 0,
        color: ColorApp.secondaryColor,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              left: _tabPositionLeft,
              child: Container(
                height: 40.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorApp.accentColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 11.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavbarItem(
                      icon: Icons.home_outlined,
                      iconSelcted: Icons.home,
                      indexItem: 0,
                      index: widget.intPage,
                      onChangedTab: onChangedTab),
                  NavbarItem(
                      icon: Icons.work_outline,
                      iconSelcted: Icons.work,
                      indexItem: 1,
                      index: widget.intPage,
                      onChangedTab: onChangedTab),
                  NavbarItem(
                      icon: Icons.mail_outline,
                      iconSelcted: Icons.mail,
                      indexItem: 2,
                      index: widget.intPage,
                      onChangedTab: onChangedTab),
                  NavbarItem(
                      icon: Icons.person_outline,
                      iconSelcted: Icons.person,
                      indexItem: 3,
                      index: widget.intPage,
                      onChangedTab: onChangedTab),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
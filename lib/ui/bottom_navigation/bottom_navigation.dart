import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/home/home.dart';
import 'package:lowongan_pekerjaan/ui/kotak_masuk/kotak_masuk.dart';
import 'package:lowongan_pekerjaan/ui/profil/profil.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _initPage = 0;

  final pages = const [
    HomePage(),
    Center(child: Text("Halaman 2", style: TextStyle(color: Colors.black))),
    KotakMasukPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_initPage],
        bottomNavigationBar: ConvexAppBar(
          height: 60,
          activeColor: ColorApp.accentColor,
          backgroundColor: ColorApp.secondaryColor,
          top: -14,
          style: TabStyle.reactCircle,
          items: const [
            TabItem(
              icon: Icons.home,
              title: 'Home',
              isIconBlend: false,
            ),
            TabItem(
              icon: Icons.backpack,
              title: 'Pekerjaan',
              isIconBlend: false,
            ),
            TabItem(
              icon: Icons.mail,
              title: 'Pesan',
              isIconBlend: false,
            ),
            TabItem(
              icon: Icons.person,
              title: 'Profil',
              isIconBlend: false,
            ),
          ],
          onTap: (int i) => setState(() {
            _initPage = i;
          }),
        ));
  }
}

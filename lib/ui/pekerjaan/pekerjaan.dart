import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/proses_lamaran.dart';

class PekerjaanPage extends StatefulWidget {
  const PekerjaanPage({super.key});

  @override
  State<PekerjaanPage> createState() => _PekerjaanPageState();
}

class _PekerjaanPageState extends State<PekerjaanPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.primaryColor,
        title: Container(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(appbar_logo, height: 30, width: 63),
        ),
        bottom: PreferredSize(
          preferredSize: Size(screenSize.width, 70.h),
          child: TabBar(
            controller: _tabController,
            unselectedLabelColor: Color.fromARGB(255, 131, 131, 131),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 5.h,
                color: ColorApp.accentColor,
              ),
            ),
            tabs: [
              Container(
                height: 70.h,
                alignment: Alignment.center,
                child: Text("Proses Lamaran"),
              ),
              Container(
                height: 70.h,
                alignment: Alignment.center,
                child: Text("Hasil Lamaran"),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProsesLamaranTab(),
          Center(
            child: Text(
              "Coming Soon",
              style: TextStyle(color: ColorApp.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

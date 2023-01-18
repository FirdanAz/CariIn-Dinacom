import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/ui/pekerjaan/proses_lamaran/no_have.dart';
import 'package:lowongan_pekerjaan/ui/widget/Pekerjaan_card.dart';

class ProsesLamaranTab extends StatelessWidget {
  ProsesLamaranTab({super.key});
  bool isHaveLamaran = true;

  @override
  Widget build(BuildContext context) {
    return isHaveLamaran
        ? ListView.separated(
            itemCount: 5,
            padding: EdgeInsets.all(25.h),
            separatorBuilder: (context, index) => Divider(
              height: 20.h,
              color: Colors.transparent,
            ),
            itemBuilder: (context, index) {
              return PekerjaanCard(
                status: "Sedang dicek oleh perusahaan",
              );
            },
          )
        : const NoHaveProsesLamaran();
  }
}

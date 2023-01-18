import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/detail/firebase_api.dart';
import 'package:path/path.dart';

class LamarPage extends StatefulWidget {
  String? lowonganName;
  String? companyName;
  String? locationCompany;
  String? minimalEducationCompany;
  String? professionCompany;
  int? wagesCompany;
  int? ageRequiredCompany;
  int? peopleRequired;
  String? experienceRequiredCompany;
  String? descriptionCompany;
  String? aboutCompany;
  String? conditionCompany;
  String? descriptionJob;
  String? date;
  bool? isConfirm;
  LamarPage({super.key,
    required this.lowonganName,
    required this.companyName,
    required this.locationCompany,
    required this.minimalEducationCompany,
    required this.professionCompany,
    required this.wagesCompany,
    required this.ageRequiredCompany,
    required this.peopleRequired,
    required this.experienceRequiredCompany,
    required this.descriptionCompany,
    required this.aboutCompany,
    required this.conditionCompany,
    required this.descriptionJob,
    required this.date,
    required this.isConfirm});

  @override
  State<LamarPage> createState() => _LamarPageState();
}

class _LamarPageState extends State<LamarPage> {
  final _nomorTelepon = TextEditingController();
  final _suratLamaran = TextEditingController();
  File? file;
  UploadTask? task;
  DateTime dateTime = DateTime.now();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if(result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }
  final _numberToMonthMap = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'Mei',
    6: 'Jun',
    7: 'Jul',
    8: 'Agu',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Des'
  };

  Future uploadFile(
      BuildContext context,
      String lowonganName,
      String companyName,
      String locationCompany,
      String minimalEducationCompany,
      String professionCompany,
      int wagesCompany,
      int ageRequiredCompany,
      int peopleRequired,
      String experienceRequiredCompany,
      String descriptionCompany,
      String aboutCompany,
      String conditionCompany,
      String descriptionJob,
      ) async {
    if(file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);

    if(task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('user').doc('pfDgeo0P06NwmaIgGfcl').collection('lowongan').doc(widget.lowonganName).collection(FirebaseAuth.instance.currentUser!.uid.toString()).doc(widget.lowonganName);
    documentReference.set({
      'email': FirebaseAuth.instance.currentUser!.email,
      'date': '${_numberToMonthMap[dateTime.month]} ${dateTime.day} ${dateTime.year}',
      'urlFile' : urlDownload,
      'nomorTelepon' : _nomorTelepon.text,
      'suratLamaran' : _suratLamaran.text,
      'isConfirm': true,
      'lowonganName': lowonganName,
      'companyName': companyName,
      'locationCompany': locationCompany,
      'minimalEducationCompany': minimalEducationCompany,
      'professionCompany': professionCompany,
      'wagesCompany': wagesCompany,
      'ageRequiredCompany': ageRequiredCompany,
      'peopleRequired': peopleRequired,
      'experienceRequiredCompany': experienceRequiredCompany,
      'descriptionCompany': descriptionCompany,
      'aboutCompany': aboutCompany,
      'conditionCompany': conditionCompany,
      'descriptionJob': descriptionJob,
      'date':
      '${_numberToMonthMap[dateTime.month]} ${dateTime.day} ${dateTime.year}',
      'isActive' : true
    });

    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Lowongan Telah Dilamar', style: TextStyle(color: ColorApp.accentColor),),
          content: const Text('Menunggu konfirmasi dari Perusahaan', style: TextStyle(color: Colors.black87),),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Iya'),
              child: const Text('Iya'),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final _fileName = file != null ? basename(file!.path) : "Belum Upload";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lamar Pekerjaan",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 10,
        toolbarHeight: 70.h,
        backgroundColor: ColorApp.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                Text("Kamu akan Melamar di", style: _styleHeader(false)),
                Text(widget.companyName.toString(), style: _styleHeader(true)),
                Text("sebagai", style: _styleHeader(false)),
                Text(widget.professionCompany.toString(), style: _styleHeader(true)),
                SizedBox(height: 25.h),

                // Resume
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title("Resume", Icons.content_paste),
                    SizedBox(height: 5.h),
                    Text(
                      "Upload file dalam format PDF, maksimal 5MB. Upload sekali saja, kamu bisa pakai lagi di lamaran selanjutnya.",
                      style: _styleContent(),
                    ),
                    Text(
                      _fileName,
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: ColorApp.primaryColor
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                InkWell(
                  onTap: () {
                    selectFile();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 310.w,
                      height: 90.h,
                      color: ColorApp.accentColor,
                      child: const Center(
                        child: Text(
                          'Upload File',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Kontak
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title("Kontak", Icons.call),
                    SizedBox(height: 5.h),
                    Container(
                      height: 40.h,
                      width: 310.w,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: ColorApp.accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _nomorTelepon,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Nomor HP",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Perusahaan memerlukan informasi ini untuk menghubungimu lebih cepat.",
                      style: _styleContent(),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),

                // Surat Lamaran
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title("Surat Lamaran", Icons.create),
                    SizedBox(height: 5.h),
                    Container(
                      width: 310.w,
                      constraints: BoxConstraints(minHeight: 100.h),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: ColorApp.accentColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _suratLamaran,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Tulis surat lamaran anda..",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Ceritakan mengapa kamu ingin melamar pekerjaan di perusahaan ini.",
                      style: _styleContent(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(0.25)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 40.h,
              width: 268.w,
              child: ElevatedButton(
                onPressed: () {
                  uploadFile(context, widget.lowonganName.toString(), widget.companyName.toString(), widget.locationCompany.toString(), widget.minimalEducationCompany.toString(), widget.professionCompany.toString(), int.parse(widget.wagesCompany.toString()), int.parse(widget.ageRequiredCompany.toString()), int.parse(widget.peopleRequired.toString()), widget.experienceRequiredCompany.toString(), widget.descriptionCompany.toString(), widget.aboutCompany.toString(), widget.conditionCompany.toString(), widget.descriptionJob.toString());
                },
                style: ElevatedButton.styleFrom(primary: ColorApp.accentColor),
                child: Text(
                  "LAMAR SEKARANG",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _styleHeader(bool isImportant) {
    return TextStyle(
      fontSize: 13.sp,
      color: ColorApp.primaryColor,
      fontWeight: isImportant ? FontWeight.w600 : FontWeight.w500,
    );
  }

  TextStyle _styleContent() {
    return TextStyle(
      fontSize: 10.sp,
      color: ColorApp.accentColor,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _title(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18.w, color: ColorApp.primaryColor),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: ColorApp.accentColor,
          ),
        )
      ],
    );
  }
}

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/model/city_model.dart';
import 'package:http/http.dart' as http;
import '../../common/color_app.dart';

class CreateLowongan extends StatefulWidget {
  const CreateLowongan({Key? key}) : super(key: key);

  @override
  State<CreateLowongan> createState() => _CreateLowonganState();
}

class _CreateLowonganState extends State<CreateLowongan> {
  final _lowonganName = TextEditingController();
  final _companyName = TextEditingController();
  final _locationCompany = TextEditingController();
  final _peopleRequired = TextEditingController();
  final _profiessionCompany = TextEditingController();
  final _wagesCompany = TextEditingController();
  final _ageRequiredCompany = TextEditingController();
  final _experienceRequiredCompany = TextEditingController();
  final _descriptionCompany = TextEditingController();
  final _aboutCompany = TextEditingController();
  final _conditionCompany = TextEditingController();
  final _descriptionJob = TextEditingController();

  var urlLinkLocation =
      "http://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=32";
  bool isLoadedApi = false;
  List _dataCity = [];
  String _varCity = "Kabupaten Bogor";
  CityModel? cityModel;
  String selectedValuePendidikan = "SMK";
  String? selectedValueKota;
  DateTime dateTime = DateTime.now();

  bool isConfirm = false;

  void getApi() async {
    final resPopular = await http.get(Uri.parse(urlLinkLocation));
    cityModel = CityModel.fromJson(json.decode(resPopular.body.toString()));
    setState(() {
      isLoadedApi = true;
      _dataCity.add(cityModel);
    });
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

  List<DropdownMenuItem<String>> get dropdownItemsPendidikan {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "SMK", child: Text("SMK")),
      DropdownMenuItem(value: "SMP", child: Text("SMP")),
      DropdownMenuItem(value: "SD", child: Text("SD")),
      DropdownMenuItem(value: "Tidak Sekolah", child: Text("Tidak Sekolah")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsKota {
    List<DropdownMenuItem<String>> kotaItems = [
      for (int i = 0; i < cityModel!.kotaKabupaten!.length; i++)
        DropdownMenuItem(
          value: cityModel!.kotaKabupaten![i].nama.toString(),
          child: Text(cityModel!.kotaKabupaten![i].nama.toString()),
        )
    ];
    return kotaItems;
  }

  Future createJobs(
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
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('admin')
        .doc('Z1u1IE4vrZpjXGCPsGJs')
        .collection("allData")
        .doc(lowonganName);
    documentReference.set({
      'isConfirm': isConfirm,
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
          '${_numberToMonthMap[dateTime.month]} ${dateTime.day} ${dateTime.year}'
    });
    documentReference.update({
      'isConfirm': isConfirm,
      'lowonganName': lowonganName,
      'companyName': companyName,
      'locationCompany': locationCompany,
      'minimalEducationCompany': minimalEducationCompany,
      'professionCompany': professionCompany,
      'wagesCompany': wagesCompany,
      'ageRequiredCompany': ageRequiredCompany,
      'experienceRequiredCompany': experienceRequiredCompany,
      'descriptionCompany': descriptionCompany,
      'aboutCompany': aboutCompany,
      'conditionCompany': conditionCompany,
      'descriptionJob': descriptionJob,
      'date':
          '${_numberToMonthMap[dateTime.month]} ${dateTime.day} ${dateTime.year}'
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buat Lowongan",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        titleSpacing: 10,
        toolbarHeight: 70.h,
        backgroundColor: ColorApp.primaryColor,
      ),
      body: isLoadedApi
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textFieldCard('Nama Lowongan', _lowonganName),
                    SizedBox(height: 15.h),
                    _textFieldCard('Nama Perusahaan / Group', _companyName),
                    SizedBox(height: 15.h),
                    _textFieldCard('Daerah', _locationCompany),
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pendidikan Terakhir',
                          style: TextStyle(
                              color: ColorApp.accentColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 55.h,
                          child: DropdownButton<String>(
                            value: selectedValuePendidikan,
                            elevation: 18,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_downward),
                            style:
                                const TextStyle(color: ColorApp.primaryColor),
                            underline: Container(
                              height: 2,
                              color: ColorApp.primaryColor,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                selectedValuePendidikan = value!;
                              });
                            },
                            items: dropdownItemsPendidikan,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    _textFieldCard('Profesi dibuhkan', _profiessionCompany),
                    SizedBox(height: 15.h),
                    _numberFieldCard('Gaji Lowongan', _wagesCompany),
                    SizedBox(height: 15.h),
                    _numberFieldCard('Umur Minimal', _ageRequiredCompany),
                    SizedBox(height: 15.h),
                    _numberFieldCard('Orang Dibuthkan', _peopleRequired),
                    SizedBox(height: 15.h),
                    _textFieldCard(
                        'Pengalaman dibutuhkan', _experienceRequiredCompany),
                    SizedBox(height: 15.h),
                    _textFieldCard('Deskripsi Lowongan', _descriptionCompany),
                    SizedBox(height: 15.h),
                    _textFieldCard('Tentang Perusahaan', _aboutCompany),
                    SizedBox(height: 15.h),
                    _textFieldCard('Syarat Pekerjaan', _conditionCompany),
                    SizedBox(height: 15.h),
                    _textFieldCard('Deskripsi pekerjaan', _descriptionJob),
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kabupaten / Kota',
                          style: TextStyle(
                              color: ColorApp.accentColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5.h),
                        SizedBox(
                          height: 55.h,
                          child: DropdownButton<String>(
                            value: selectedValueKota,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 18,
                            style:
                                const TextStyle(color: ColorApp.primaryColor),
                            underline: Container(
                              height: 2,
                              color: ColorApp.primaryColor,
                            ),
                            items: dropdownItemsKota,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValueKota = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          createJobs(
                              _lowonganName.text,
                              _companyName.text,
                              _locationCompany.text,
                              selectedValuePendidikan.trim().toString(),
                              _profiessionCompany.text,
                              int.parse(_wagesCompany.text),
                              int.parse(_ageRequiredCompany.text),
                              int.parse(_peopleRequired.text),
                              _experienceRequiredCompany.text,
                              _descriptionCompany.text,
                              _aboutCompany.text,
                              _conditionCompany.text,
                              _descriptionJob.text);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: ColorApp.accentColor,
                          child: Text(
                            'Buat Lowongan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _textFieldCard(String title, TextEditingController editingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: ColorApp.accentColor, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 55.h,
          child: TextField(
            controller: editingController,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintStyle: const TextStyle(color: Colors.black45),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: ColorApp.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              hintText: '$title Anda',
            ),
          ),
        ),
      ],
    );
  }

  Widget _numberFieldCard(
      String title, TextEditingController editingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: ColorApp.accentColor, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 55.h,
          child: TextField(
            controller: editingController,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintStyle: const TextStyle(color: Colors.black45),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: ColorApp.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              hintText: '$title Anda',
            ),
          ),
        ),
      ],
    );
  }
}

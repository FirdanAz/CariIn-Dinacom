import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _minimalEducationCompany = TextEditingController();
  final _profiessionCompany = TextEditingController();
  final _wagesCompany = TextEditingController();
  final _ageRequiredCompany = TextEditingController();
  final _experienceRequiredCompany = TextEditingController();
  final _descriptionCompany = TextEditingController();
  final _aboutCompany = TextEditingController();
  final _conditionCompany = TextEditingController();
  final _descriptionJob = TextEditingController();

  var urlLinkLocation = "http://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=32";
  bool isLoadedApi = false;
  List<CityModel> _dataCity = [];
  String _varCity = "Kabupaten Bogor";

  String selectedValue = "SMK";

  void getApi() async {
    final resPopular = await http.get(Uri.parse(
      urlLinkLocation
    ));
     CityModel cityModel =
        CityModel.fromJson(json.decode(resPopular.body.toString()));
    setState(() {
      isLoadedApi = true;
      _dataCity.add(cityModel);
    });
  }

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("SMK"),value: "SMK"),
      DropdownMenuItem(child: Text("SMP"),value: "SMP"),
      DropdownMenuItem(child: Text("SD"),value: "SD"),
      DropdownMenuItem(child: Text("Tidak Sekolah"),value: "Tidak Sekolah"),
    ];
    return menuItems;
  }

  Future createJobs(
    String lowonganName,
    String companyName,
    String locationCompany,
    String minimalEducationCompany,
    String professionCompany,
    int wagesCompany,
    int ageRequiredCompany,
    String experienceRequiredCompany,
    String descriptionCompany,
    String aboutCompany,
    String conditionCompany,
    String descriptionJob,
  ) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('admin')
        .doc().collection("userJobData").doc();
    documentReference.set({
      'lowonganName' : lowonganName,
      'companyName' : companyName,
      'locationCompany' : locationCompany,
      'minimalEducationCompany' : minimalEducationCompany,
      'professionCompany' : professionCompany,
      'wagesCompany' : wagesCompany,
      'ageRequiredCompany' : ageRequiredCompany,
      'experienceRequiredCompany' : experienceRequiredCompany,
      'descriptionCompany' : descriptionCompany,
      'aboutCompany' : aboutCompany,
      'conditionCompany' : conditionCompany,
      'descriptionJob' : descriptionJob,
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
        backgroundColor: ColorApp.primaryColor,
        title: Text(
          'Buat Lowongan',
          style: TextStyle(

          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textFieldCard('Nama Lowongan', _lowonganName),
              _textFieldCard('Nama Perusahaan / Group', _companyName),
              _textFieldCard('Daerah', _locationCompany),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pendidikan Terakhir',
                    style: TextStyle(
                        color: ColorApp.accentColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 55,
                      width: double.maxFinite,
                      child: DropdownButton<String>(
                          value: selectedValue,
                          icon: Container(alignment: Alignment.centerRight,child: const Icon(Icons.arrow_downward)),
                          elevation: 18,
                          style: const TextStyle(color: ColorApp.primaryColor),
                          underline: Container(
                            height: 2,
                            color: ColorApp.primaryColor,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          items: dropdownItems
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              _textFieldCard('Profesi dibuhkan', _profiessionCompany),
              _numberFieldCard('Gaji Lowongan', _wagesCompany),
              _numberFieldCard('Umur Minimal', _ageRequiredCompany),
              _textFieldCard('Pengalaman dibutuhkan', _experienceRequiredCompany),
              _textFieldCard('Deskripsi Lowongan', _descriptionCompany),
              _textFieldCard('Tentang Perusahaan', _aboutCompany),
              _textFieldCard('Syarat Pekerjaan', _conditionCompany),
              _textFieldCard('Deskripsi pekerjaan', _descriptionJob),
              Center(
                child: InkWell(
                  onTap: () {
                    createJobs(
                        _lowonganName.text,
                        _companyName.text,
                        _locationCompany.text,
                        selectedValue.trim().toString(),
                        _profiessionCompany.text,
                        int.parse(_wagesCompany.text),
                        int.parse(_ageRequiredCompany.text),
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
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ]
          ),
        ),
      )
    );
  }

  Widget _textFieldCard(String title, TextEditingController editingController)  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: ColorApp.accentColor,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 55,
          child: TextField(
            controller: editingController,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.black45),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: ColorApp.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              hintText: '$title Anda',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _numberFieldCard(String title, TextEditingController editingController)  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: ColorApp.accentColor,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 55,
          child: TextField(
            controller: editingController,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.black45),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: ColorApp.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              hintText: '$title Anda',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

}

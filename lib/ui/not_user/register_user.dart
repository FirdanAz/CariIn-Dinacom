import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:lowongan_pekerjaan/ui/bottom_navigation/bottom_navigation.dart';

import '../../common/color_app.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _nomorController = TextEditingController();
  final _dateController = TextEditingController();
  final _statusKerjaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _pendidikanController = TextEditingController();
  DateTime dateTime = DateTime.now();
  String selectedValue = "SMK";

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      addDetailUser(_nameController.text.trim(), _nomorController.text.trim(),
          _usernameController.text.trim(), _dateController.text.trim(), _alamatController.text.trim(), _statusKerjaController.text.trim(), selectedValue.trim());
    }
  }

  Future addDetailUser(String name, String nomor, String email, String date, String alamat, String statusKerja, String pendidikanTerakhir) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    documentReference.set({'nomor': nomor, 'name': name, 'email': email, 'date':date, 'alamat' : alamat, 'status_kerja' : statusKerja, 'pendidikan' : pendidikanTerakhir});
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  var _numberToMonthMap = {
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

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("SMK"),value: "SMK"),
      DropdownMenuItem(child: Text("SMP"),value: "SMP"),
      DropdownMenuItem(child: Text("SD"),value: "SD"),
      DropdownMenuItem(child: Text("Tidak Sekolah"),value: "Tidak Sekolah"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorApp.primaryColor,
        title: Text(
          'Daftar',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
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
                        controller: _usernameController,
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
                          hintText: 'Email Anda',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nama',
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
                        controller: _nameController,
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
                          hintText: 'Nama Anda',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nomor Telepon',
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
                        controller: _nomorController,
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
                          hintText: 'Nomor Telepon Anda',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tanggal Lahir',
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
                        controller: _dateController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          ).then((value) {
                            setState(() {
                              dateTime = value!;
                              _dateController.text = '${_numberToMonthMap[dateTime.month]} ${dateTime.day} ${dateTime.year}';
                            });
                          });

                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.black45),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: ColorApp.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Tanggal Lahir Anda',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Alamat',
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
                        controller: _alamatController,
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
                          hintText: 'Alamat Anda',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Status Pekerjaan',
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
                        controller: _statusKerjaController,
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
                          hintText: 'Status Pekerjaan Anda',
                        ),
                      ),
                    ),
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
                    Text(
                      'Kata Sandi',
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
                        controller: _passwordController,
                        obscureText: true,
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
                          hintText: 'Kata Sandi Anda',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Konfirmasi Kata Sandi',
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
                        controller: _confirmPasswordController,
                        obscureText: true,
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
                          hintText: 'Konfirmasi Kata Sandi Anda',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomBottomNavBar(intPage: 3),
                      ));
                },
                child: Text(
                  'Sudah Punya Akun?',
                  style: TextStyle(
                      color: ColorApp.accentColor, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () async {
                  signUp();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomBottomNavBar(intPage: 0),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Color.fromARGB(255, 23, 23, 23),
                      duration: Duration(seconds: 1),
                      content: Row(
                        children: [
                          Icon(Icons.login,
                              color: ColorApp.accentColor, size: 18),
                          SizedBox(width: 15),
                          Text("Login Success"),
                        ],
                      )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: ColorApp.accentColor,
                    height: 50,
                    child: Center(
                      child: Text('Daftar'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

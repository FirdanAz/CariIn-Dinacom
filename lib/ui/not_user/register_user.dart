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

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      addDetailUser(_nameController.text.trim(), _nomorController.text.trim(),
          _usernameController.text.trim());
    }
  }

  Future addDetailUser(String name, String nomor, String email) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    documentReference.set({'nomor': nomor, 'name': name, 'email': email});
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    thickness: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'atau',
                      style: TextStyle(color: Colors.black45),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SignInButton(
                    Buttons.Google,
                    onPressed: () async {},
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.LinkedIn,
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

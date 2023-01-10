import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/bottom_navigation/bottom_navigation.dart';
import 'package:lowongan_pekerjaan/ui/not_user/register_user.dart';

class NotUserLogin extends StatefulWidget {
  const NotUserLogin({Key? key}) : super(key: key);

  @override
  State<NotUserLogin> createState() => _NotLoginState();
}

class _NotLoginState extends State<NotUserLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> currentUser() async {
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
    await account!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final UserCredential authResult =
    await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    return user;
  }

  static Future<User?> loginUsingEmailPaswword(
      {required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('No user found for that email');
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorApp.primaryColor,
        title: Text(
          'Profil',
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
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Belum punya akun?',
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
                  User? user = await loginUsingEmailPaswword(
                      email: _usernameController.text,
                      password: _passwordController.text,
                      context: context);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CustomBottomNavBar(intPage: 3),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Color.fromARGB(255, 23, 23, 23),
                        duration: Duration(seconds: 1),
                        content: Row(
                          children: [
                            Icon(Icons.login, color: Colors.orange, size: 18),
                            SizedBox(width: 15),
                            Text("Login Success"),
                          ],
                        )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Color.fromARGB(255, 23, 23, 23),
                        duration: Duration(seconds: 1),
                        content: Row(
                          children: [
                            Icon(Icons.error,
                                color: Color.fromARGB(255, 213, 70, 70),
                                size: 18),
                            SizedBox(width: 15),
                            Text("Login Failed"),
                          ],
                        )));
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: ColorApp.accentColor,
                    height: 50,
                    child: Center(
                      child: Text('Masuk'),
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
                    onPressed: () async {
                      currentUser();
                    },
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
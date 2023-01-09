import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lowongan_pekerjaan/common/svg_assets.dart';
import 'package:lowongan_pekerjaan/ui/bottom_navigation/bottom_navigation.dart';
import 'package:lowongan_pekerjaan/ui/home/home.dart';
import 'package:page_transition/page_transition.dart';

import '../../common/color_app.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  double _logoOpacity = 0;
  Future<FirebaseApp> _initializedFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future _initialize() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _logoOpacity = 1;
    });
    Timer(Duration(seconds: 2), () {
      // Navigator.pushReplacement(context,
      //     PageTransition(child: FutureBuilder(
      //       future: _initializedFirebase(),
      //       builder: (context, snapshot) {
      //         if(snapshot.connectionState == ConnectionState.done){
      //           return FirebaseAuth.instance.currentUser == null ?  const LoginPage() : BottomNavbar();
      //         }
      //         return const Center(child: CircularProgressIndicator());
      //       },), type: PageTransitionType.fade));
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: CustomBottomNavBar(intPage: 0),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 900),
              curve: Curves.ease));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.secondaryColor,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 360),
          opacity: _logoOpacity,
          child: SvgPicture.asset(appbar_logo),
        ),
      ),
    );
  }
}

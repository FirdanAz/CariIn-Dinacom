import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

class NotUserLogin extends StatefulWidget {
  const NotUserLogin({Key? key}) : super(key: key);

  @override
  State<NotUserLogin> createState() => _NotLoginState();
}

class _NotLoginState extends State<NotUserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorApp.primaryColor,
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(
            fontSize: 15
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(
              right: 10,
              left: 10
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama',
                    style: GoogleFonts.poppins(
                      color: ColorApp.accentColor
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.black
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.black45
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 2,
                          color: ColorApp.primaryColor,
                        ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        hintText: 'Nama',
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Nama perusahaan',
                    style: GoogleFonts.poppins(
                        color: ColorApp.accentColor
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 55,
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: GoogleFonts.poppins(
                            color: Colors.black45
                        ),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                          width: 2,
                          color: ColorApp.primaryColor,
                        ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        hintText: 'Perusahaan',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

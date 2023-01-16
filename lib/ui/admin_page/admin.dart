import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';

import '../widget/lowongan_card_horizontal.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final CollectionReference _allData = FirebaseFirestore.instance
      .collection('admin')
      .doc('Z1u1IE4vrZpjXGCPsGJs')
      .collection('allData');
  bool isConfirm = true;

  Future confirm(bool isConfirms, String lowonganName) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('admin')
        .doc('Z1u1IE4vrZpjXGCPsGJs').collection("allData").doc(lowonganName);
    documentReference.update({
      'isConfirm' : true
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            expandedHeight: 100,
            backgroundColor: ColorApp.primaryColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: Container(
                height: 50,
                child: Text(
                  'Halaman Konfirmasi',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  StreamBuilder(
                    stream: _allData.where('isConfirm', isEqualTo: false).snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documnentSnapshot =
                            streamSnapshot.data!.docs[index];
                            return InkWell(
                              onTap: () {
                                confirm(isConfirm, documnentSnapshot['lowonganName']);
                              },
                              child: ListTile(
                                leading: Icon(Icons.account_circle),
                                subtitle: Text(documnentSnapshot['companyName']),
                                title: Text(documnentSnapshot['lowonganName'], style: TextStyle(color: ColorApp.accentColor, fontWeight: FontWeight.w500),),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    confirm(isConfirm, documnentSnapshot['lowonganName']);
                                  },
                                  child: Text('Konfirmasi', style: TextStyle(fontSize: 12),),
                                ),
                              )
                            );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

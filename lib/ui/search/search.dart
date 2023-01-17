import 'package:flutter/material.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/database/history_search_database.dart';
import 'package:lowongan_pekerjaan/ui/search/before_search.dart';
import 'package:lowongan_pekerjaan/ui/search/result.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqflite/sqflite.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchTextController = TextEditingController();
  List<Map<String, dynamic>>? _allDataHistorySearchDatabase;
  bool isDatabaseLoading = true;
  bool isRiwayatEmpty = true;

  void getData() async {
    _allDataHistorySearchDatabase =
        await HistorySearchDatabase.instance.readAll();
    setState(() {
      isDatabaseLoading = false;
      isRiwayatEmpty = _allDataHistorySearchDatabase!.isEmpty;
    });
  }

  void deleteHistory(var context) async {
    for (var i = 1;
        i <=
            _allDataHistorySearchDatabase![
                _allDataHistorySearchDatabase!.length - 1]["_id"];
        i++) {
      await HistorySearchDatabase.instance.delete(i);
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Ingin Menghapus Riwayat Pencarian?',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel',
                  style: TextStyle(color: ColorApp.primaryColor)),
            ),
            TextButton(
              onPressed: () {
                deleteHistory(context);
                Navigator.pop(context);
                setState(() {
                  isRiwayatEmpty = true;
                });
              },
              child: const Text('OK', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 45.h, bottom: 20.h),
              child: Column(
                children: [
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorApp.primaryColor,
                    ),
                  ),
                  SizedBox(height: 45.h),
                  Container(
                    height: 46.h,
                    width: screenSize.width,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x40AAAACC),
                            offset: Offset(5, 5),
                            blurRadius: 10),
                        BoxShadow(
                            color: Color(0x80AAAACC),
                            offset: Offset(10, 10),
                            blurRadius: 20),
                        BoxShadow(
                            color: Color(0xffFFFFFF),
                            offset: Offset(-10, -10),
                            blurRadius: 20),
                      ],
                    ),
                    child: TextField(
                      controller: _searchTextController,
                      autofocus: true,
                      style: TextStyle(
                          color: ColorApp.secondaryColor, fontSize: 14.sp),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffix: SizedBox(width: 10.w),
                        prefixIcon: Icon(Icons.search, size: 20.w),
                        prefixIconColor:
                            ColorApp.secondaryColor.withOpacity(0.5),
                        hintText: "Cari loker atau perusahaan",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: ColorApp.secondaryColor.withOpacity(0.5)),
                      ),
                      onEditingComplete: () async {
                        if (_searchTextController.text.isNotEmpty) {
                          await HistorySearchDatabase.instance.create({
                            HistorySearchDatabase.columnText:
                                _searchTextController.text
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SearchResult(
                                searchText: _searchTextController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isDatabaseLoading
                      ? const Center(child: CircularProgressIndicator())
                      : isRiwayatEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Riwayat",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0x803A4750)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _showMyDialog();
                                      },
                                      child: Text(
                                        "Hapus Riwayat",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      _allDataHistorySearchDatabase!.length < 3
                                          ? _allDataHistorySearchDatabase!
                                              .length
                                          : 3,
                                  separatorBuilder: (context, index) => Divider(
                                    height: 10.h,
                                    color: Colors.transparent,
                                  ),
                                  itemBuilder: (context, index) {
                                    int reverseIndex =
                                        _allDataHistorySearchDatabase!.length -
                                            1 -
                                            index;
                                    return InkWell(
                                      onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SearchResult(
                                            searchText:
                                                _allDataHistorySearchDatabase![
                                                    reverseIndex]["text"],
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.history,
                                            size: 20.w,
                                            color: ColorApp.primaryColor,
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            _allDataHistorySearchDatabase![
                                                reverseIndex]["text"],
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0x803A4750),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kategori",
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0x803A4750)),
                        ),
                        SizedBox(height: 10.h),
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: [
                            _categoryButton("Akutansi dan Keuangan"),
                            _categoryButton("Customer Service"),
                            _categoryButton("Penjualan"),
                            _categoryButton("Logistik dan Kurir"),
                            _categoryButton("Pemasaran"),
                            _categoryButton("kesehatan, Salon, Kecantikan"),
                            _categoryButton("It dan Teknisi"),
                            _categoryButton("Tenaga Administrasi"),
                            _categoryButton("OB, Kebersihan dan Keamanan"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String text) {
    return ActionChip(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 11.h),
      backgroundColor: ColorApp.accentColor,
      labelPadding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => SearchResult(
              searchText: text,
            ),
          ),
        );
      },
      elevation: 10,
      pressElevation: 16,
      shadowColor: const Color(0x80AAAACC),
      label: Text(
        text,
        style: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
    // return Container(
    //   height: 40,
    //   width: 100,
    //   alignment: Alignment.center,
    //   padding: const EdgeInsets.symmetric(horizontal: 17),
    //   decoration: BoxDecoration(
    //     color: accentColor,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: MyText(
    //     text: text,
    //     size: 12,
    //     weight: FontWeight.w500,
    //     color: primaryColor,
    //   ),
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:lowongan_pekerjaan/common/color_app.dart';
import 'package:lowongan_pekerjaan/ui/search/before_search.dart';
import 'package:lowongan_pekerjaan/ui/search/result.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? _scrollController;
  final TextEditingController _searchTextController = TextEditingController();
  final double _height = 149;
  bool _lastStatus = true;

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (_height - kToolbarHeight);
  }

  void _scrollListener() {
    if (_isShrink != _lastStatus) {
      setState(() {
        _lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController!.removeListener(_scrollListener);
    _scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 149,
            backgroundColor: Colors.white,
            title: _isShrink
                ? Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorApp.primaryColor,
                    ),
                  )
                : null,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Padding(
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
                        onEditingComplete: () {
                          if (_searchTextController.text.isNotEmpty) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchResult(
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
            ),
          ),
          const BeforeSearch(),
        ],
      ),
    );
  }
}

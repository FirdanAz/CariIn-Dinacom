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
  final double _height = 149;
  bool _lastStatus = true;
  bool isSearch = false;

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
                ? const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorApp.primaryColor,
                    ),
                  )
                : null,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Padding(
                padding: const EdgeInsets.only(top: 45, bottom: 20),
                child: Column(
                  children: [
                    const Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorApp.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 45),
                    Container(
                      height: 40,
                      width: screenSize.width,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          ]),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 16.w,
                            color: Color(0x803A4750),
                          ),
                          SizedBox(width: 9.w),
                          Text(
                            "Search Food",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0x803A4750),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          isSearch ? const SearchResult() : const BeforeSearch(),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/model/search/search_idle/api_call_search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';
import '../../core/constants.dart';
import '../../domain/model/search/search_idle/main_search_list.dart';
import '../../domain/model/search/searched/api_call_search_result.dart';
import '../../domain/model/search/searched/searched_list.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<MainSearchList> topSearch = [];
  List<SearchedList> searchList = [];
  TextEditingController _searchController = TextEditingController();
  bool _isSearchIdle = true;

  @override
  void initState() {
    // TODO: implement initState
    _topSearch();
    // _searched();
    _searchController.addListener(_onSearchTextChanged);
    super.initState();
  }

  _topSearch() async {
    final response = await TMDBserviceSearchIdle().getMainSearchList();
    setState(() {
      topSearch = response;
    });
  }

  _searched() async {
    final response = await TMDBserviceSearched().getSearchedList();
    setState(() {
      searchList = response;
    });
  }

  void _onSearchTextChanged() {
    setState(() {
      _isSearchIdle = _searchController.text.isEmpty;
      print(_isSearchIdle);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: _searchController,
                onChanged: (value) async {
                  searchList = await getimageSearchGrid(value, searchList);
                },
                backgroundColor: Colors.white24,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              Expanded(
                  child: _isSearchIdle
                      ? SearchIdleWidget(
                          result: topSearch,
                        )
                      : SearchResultWidget(
                          results: searchList,
                        )),
              // Expanded(child: SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

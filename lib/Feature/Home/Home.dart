import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:watch/Widget/Home/CustomGrid.dart';
import 'package:watch/Widget/Home/CustomSliverText.dart';
import 'package:watch/Widget/Home/HomeTopDisplay.dart';
import 'package:watch/Widget/SliverSearch/CustomHomeSliverSearch.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _search = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];
  Future<void> fetch() async {
    final http.Response res = await http.get(
        Uri.parse('http://65.2.137.77:3000/kcg/students'),
        headers: <String, String>{
          'x-auth-token':
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZTZlNThiY2ZkNWYyZDdmZDVjNTFhOCIsImlhdCI6MTcxMTYyMDI0MX0.S5c5eht_y4jRJsDM3fSFwGNFXZDW3LKFWPN11NnDWck"
        });
    if (res.statusCode == 200) {
      setState(() {
        searchResults = List<Map<String, dynamic>>.from(jsonDecode(res.body));
      });
      print(searchResults);
    } else {
      setState(() {
        searchResults = [];
      });
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomHomeSliverSearch(
            search: _search,
          ),
          _search.text.isEmpty
              ? const HomeTopDisplay()
              : SliverToBoxAdapter(
                  child: Container(),
                ),
          const CustomHomeGrid(),
          const CustomSliverText(),
          SliverGrid.builder(
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(searchResults[index]['dp'])),
                          color: Colors.pink,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '${searchResults[index]['name']}'.toLowerCase(),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

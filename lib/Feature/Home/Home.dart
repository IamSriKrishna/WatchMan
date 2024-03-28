import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch/Widget/SliverSearch/CustomHomeSliverSearch.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomHomeSliverSearch(),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(151, 231, 225, 1),
                ),
                child: Stack(
                  children: [
                    Align(
                        alignment: const Alignment(1.5, 0),
                        child: Image.asset('asset/scan.png')),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.56,
                      height: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Vigilance',
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomHomeSliverSearch extends StatelessWidget {
  const CustomHomeSliverSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.white))),
      ),
      actions: [
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.dribbble.com/users/916023/screenshots/14873242/media/a379bc040ab7f090580ed39c6e13c551.png?compress=1&resize=1200x900'))),
        )
      ],
    );
  }
}

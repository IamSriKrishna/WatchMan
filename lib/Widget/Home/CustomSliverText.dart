import 'package:flutter/cupertino.dart';

class CustomSliverText extends StatelessWidget {
  const CustomSliverText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Text(
          "Students",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

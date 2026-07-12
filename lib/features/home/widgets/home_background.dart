import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset("assets/images/bg2.png", fit: BoxFit.fitWidth),
    );
  }
}

import 'package:flutter/material.dart';

import 'homepage.dart';


void main() {
  runApp(const BMI());
}


class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


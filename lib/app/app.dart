import 'package:flutter/material.dart';
import 'package:my_app_name/feature/home/pages/home_page.dart';

class Oreo extends StatelessWidget {
  const Oreo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

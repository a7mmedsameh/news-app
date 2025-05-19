import 'package:flutter/material.dart';
import 'package:project_6/pages/home_page.dart';

void main() {
  runApp(const NewsCloud());
}

class NewsCloud extends StatelessWidget {
  const NewsCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

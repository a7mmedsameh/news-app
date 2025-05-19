import 'package:flutter/material.dart';
import 'package:project_6/widgets/news_listveiw_builder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [NewsListVeiwBuilder(category: category)],
        ),
      ),
    );
  }
}

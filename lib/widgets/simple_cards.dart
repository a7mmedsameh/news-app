import 'package:flutter/material.dart';
import 'package:project_6/models/card_model.dart';
import 'package:project_6/pages/category_page.dart';

class SimpleCardOne extends StatelessWidget {
  const SimpleCardOne({super.key, required this.categoryOne});
  final CardModel categoryOne;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryPage(category: categoryOne.name);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 100,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(categoryOne.image),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              categoryOne.name,
            ),
          ),
        ),
      ),
    );
  }
}

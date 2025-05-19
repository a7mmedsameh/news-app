import 'package:flutter/material.dart';
import 'package:project_6/widgets/simple_cards.dart';
import 'package:project_6/models/card_model.dart';

class CardListVeiw extends StatelessWidget {
  CardListVeiw({super.key});
  final List<CardModel> cards = [
    CardModel(image: 'images/business.jpg', name: 'business'),
    CardModel(image: 'images/entertaiment.jpg', name: 'entertainment'),
    CardModel(image: 'images/general.jpg', name: 'general'),
    CardModel(image: 'images/health.jpg', name: 'health'),
    CardModel(image: 'images/science.jpg', name: 'science'),
    CardModel(image: 'images/sports.jpg', name: 'sports'),
    CardModel(image: 'images/technology.jpeg', name: 'technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, i) {
          return SimpleCardOne(categoryOne: cards[i]);
        },
      ),
    );
  }
}

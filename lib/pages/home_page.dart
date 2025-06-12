import 'package:flutter/material.dart';
import 'package:project_6/widgets/card_listveiw.dart';
import 'package:project_6/widgets/news_listveiw_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              "News",
            ),
            Text(
              style: TextStyle(
                color: Color(0xffdc9c2e),
                fontWeight: FontWeight.bold,
              ),
              "Cloud",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CardListVeiw(),
              ),
            ),
            NewsListVeiwBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}

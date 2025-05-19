import 'package:flutter/material.dart';
import 'package:project_6/models/news_model.dart';
import 'package:project_6/widgets/simple_news.dart';

class NewsListveiw extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsListveiw({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return SimpleNews(articleModel: articles[index]);
      }, childCount: articles.length),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_6/models/news_model.dart';
import 'package:project_6/services/news_services.dart';
import 'package:project_6/widgets/news_listveiw.dart';

class NewsListVeiwBuilder extends StatefulWidget {
  const NewsListVeiwBuilder({super.key, required this.category});
final String category;
  @override
  State<NewsListVeiwBuilder> createState() => _NewsListVeiwBuilderState();
}

class _NewsListVeiwBuilderState extends State<NewsListVeiwBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListveiw(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text('there was an error, try again later'),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }
      },
    );
  }
}

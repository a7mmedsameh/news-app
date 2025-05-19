import 'package:dio/dio.dart';
import 'package:project_6/models/news_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?apiKey=8f97ecd073684a55800c182ca9a9dd56&country=us&category=$category',
    );
    Map<String, dynamic> jsonData = response.data;

    List<dynamic> articles = jsonData['articles'];

    List<ArticleModel> articlesList = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(article);
      articlesList.add(articleModel);
    }
    return articlesList;
  }
}

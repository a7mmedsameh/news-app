import 'package:dio/dio.dart';
import 'package:project_6/models/news_model.dart';

class NewsServices {
  final Dio dio;
  final String urlLink = 'https://newsapi.org/v2';
  final String apiKey = '8f97ecd073684a55800c182ca9a9dd56';
  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        '$urlLink/top-headlines?apiKey=$apiKey&country=us&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['message'] ?? 'oops there was an error';
      throw Exception(errMessage);
    }
  }
}

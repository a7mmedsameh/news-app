import 'package:project_6/models/news_model.dart';

class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccesLoadState extends NewsState {
  final List<ArticleModel> articles;
  NewsSuccesLoadState(this.articles);
}

class NewsErrorState extends NewsState {
  final String errorMessage;

  NewsErrorState(this.errorMessage);
}

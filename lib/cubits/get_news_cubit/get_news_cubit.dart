import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_6/cubits/get_news_cubit/get_news_states.dart';
import 'package:project_6/models/news_model.dart';
import 'package:project_6/services/news_services.dart';

class GetNewsCubit extends Cubit<NewsState> {
  GetNewsCubit() : super(NewsLoadingState());

  getNews({required String category}) async {
    emit(NewsLoadingState());
    try {
      List<ArticleModel> articleModel = await NewsServices(
        Dio(),
      ).getNews(category: category);
      emit(NewsSuccesLoadState(articleModel));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }
}

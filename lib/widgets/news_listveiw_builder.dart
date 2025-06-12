import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_6/cubits/get_news_cubit/get_news_cubit.dart';
import 'package:project_6/cubits/get_news_cubit/get_news_states.dart';
import 'package:project_6/widgets/news_listveiw.dart';

class NewsListVeiwBuilder extends StatefulWidget {
  const NewsListVeiwBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListVeiwBuilder> createState() => _NewsListVeiwBuilderState();
}

class _NewsListVeiwBuilderState extends State<NewsListVeiwBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNewsCubit>(context).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is NewsSuccesLoadState) {
          return NewsListveiw(articles: state.articles);
        } else if (state is NewsErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage, style: TextStyle(fontSize: 18)),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}




// FutureBuilder<List<ArticleModel>>(
//       future: future,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return NewsListveiw(articles: snapshot.data!);
//         } else if (snapshot.hasError) {
//           return SliverToBoxAdapter(
//             child: Text('there was an error, try again later'),
//           );
//         } else {
//           return SliverToBoxAdapter(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: Center(child: CircularProgressIndicator()),
//             ),
//           );
//         }
//       },
//     );
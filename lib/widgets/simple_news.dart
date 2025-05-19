import 'package:flutter/material.dart';
import 'package:project_6/models/news_model.dart';

class SimpleNews extends StatelessWidget {
  const SimpleNews({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              articleModel.image ??
                  'https://npr.brightspotcdn.com/dims3/default/strip/false/crop/2809x1580+2+0/resize/1400/quality/100/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F92%2Fb5%2F5b34d65b4640be2a93b4245b9d97%2Fmosura-life-sm-png.jpg',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            style: TextStyle(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            articleModel.title,
          ),
        ),
        Text(
          style: TextStyle(fontSize: 13, color: Colors.grey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          articleModel.subTitle ?? '',
        ),
      ],
    );
  }
}

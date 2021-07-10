import 'package:phaseiichallenges/repository/models/news_models.dart';

import 'news_models.dart';

class NewsModelResponse{

List<NewsModel>? newsModel;

NewsModelResponse({this.newsModel});

factory NewsModelResponse.fromJson(Map<String, dynamic> json)
{
  return NewsModelResponse(
    newsModel: (json['articles'] as List).map((e) => NewsModel.fromJson(e)).toList()
  );
}

}
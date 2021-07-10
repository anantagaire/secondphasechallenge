import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phaseiichallenges/repository/models/news_model_response.dart';

class NewsServices {

  String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=e834a6322d0d4868bee5e3b0d1aa140b";
  final client = http.Client();

  Future<NewsModelResponse> getNewsInformation() async {

    late NewsModelResponse newsModelResponse;
    
    final uri = Uri.parse(url);

    final response = await client.get(uri);

    final json = jsonDecode(response.body);

    newsModelResponse = NewsModelResponse.fromJson(json);

  print(newsModelResponse.newsModel![0].urlToImage);    

    print(newsModelResponse.newsModel!.length);

    return NewsModelResponse.fromJson(json);
  }
}

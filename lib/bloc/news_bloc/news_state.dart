import 'package:phaseiichallenges/repository/models/news_model_response.dart';

abstract class NewsState{}

class NewsInitialState extends NewsState{}
class NewsLoadingState extends NewsState{}
class NewsLoadingSuccessState extends NewsState{

  NewsModelResponse? newsModelResponse;

  NewsLoadingSuccessState({this.newsModelResponse});


}
class NewsLoadingErrorState extends NewsState{

  String? error;

  NewsLoadingErrorState({this.error});
}
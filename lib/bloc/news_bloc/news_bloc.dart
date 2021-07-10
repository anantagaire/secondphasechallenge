import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phaseiichallenges/bloc/news_bloc/news_event.dart';
import 'package:phaseiichallenges/bloc/news_bloc/news_state.dart';
import 'package:phaseiichallenges/repository/services/news_services.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>
{
  NewsBloc() : super(NewsInitialState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async*{

     NewsServices _newsService = NewsServices();

    if(event is FetchNews)
    {
      yield NewsLoadingState();

      try{


        final newsModelResponse = await _newsService.getNewsInformation();


        yield NewsLoadingSuccessState(newsModelResponse: newsModelResponse);
        
      }catch(error)
      {

        yield NewsLoadingErrorState(error: error.toString());

      }
    }
  }
  
}
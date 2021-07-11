
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phaseiichallenges/bloc/news_bloc/news_bloc.dart';
import 'package:phaseiichallenges/bloc/news_bloc/news_state.dart';
import 'package:phaseiichallenges/ui/screens/second_screen.dart';
import 'package:phaseiichallenges/ui/styles/colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundAppColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppColor,
        title: Text(
          'Trending News on USA',
          style: TextStyle(
              color: AppColors.textAppColor,
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoadingSuccessState) {
            return ListView.builder(
                itemCount: state.newsModelResponse!.newsModel!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen(newsModel: state.newsModelResponse!.newsModel![index],)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundAppColor,
                          borderRadius: BorderRadius.circular(15)),
                      height: height * 0.15,
                      child: Row(
                        children: [
                          Container(
                            height: height * 0.15,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                //shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                     state.newsModelResponse!
                                              .newsModel![index].urlToImage
                                              .toString(),
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: height * 0.15,
                            width: width * 0.64,
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Text(
                              state.newsModelResponse!.newsModel![index].title
                                  .toString(),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.textAppColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (state is NewsLoadingErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}

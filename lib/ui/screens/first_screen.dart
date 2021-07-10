import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phaseiichallenges/bloc/news_bloc/news_bloc.dart';
import 'package:phaseiichallenges/bloc/news_bloc/news_state.dart';
import 'package:phaseiichallenges/ui/styles/colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('5');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(

          builder: (context, state)
            {
            if(state is NewsLoadingState)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is NewsLoadingSuccessState)
            {
              return ListView.builder(
            itemCount: state.newsModelResponse!.newsModel!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.backgroundAppColor,
                    borderRadius: BorderRadius.circular(15)),
                height: height * 0.2,
                child: Row(
                  children: [
                    Container(
                      height: height * 0.20,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                              state.newsModelResponse!.newsModel![index].urlToImage.toString()=='No Image'?"https://banner2.cleanpng.com/20180605/wzl/kisspng-computer-icons-image-file-formats-no-image-5b16ff0d4b81e2.4246835515282337413093.jpg":state.newsModelResponse!.newsModel![index].urlToImage.toString(),
            
                            ),
                            fit: BoxFit.cover
                          )),
                    )
                  ],
                ),
              );
            });
            }
            else if(state is NewsLoadingErrorState)
            {
              return Center(
                child: Text(
                  state.error.toString()
                ),
              );
            }
            else{
              return Container();
            }
          },
        )
        
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:phaseiichallenges/repository/models/news_models.dart';
import 'package:phaseiichallenges/ui/screens/web_view_screen.dart';
import 'package:phaseiichallenges/ui/styles/colors.dart';

class SecondScreen extends StatelessWidget {
  final NewsModel newsModel;

  const SecondScreen({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: height * 0.5,
            width: width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(newsModel.urlToImage.toString())),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    EdgeInsets.only(top: 15, left: 10, bottom: 10, right: 5),
                height: height * 0.6,
                width: width,
                decoration: BoxDecoration(
                    color: AppColors.backgroundAppColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            newsModel.title.toString(),
                            style: TextStyle(
                                color: AppColors.textAppColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Source-Name : ${newsModel.source!.name.toString()}',
                          style: TextStyle(
                              color: AppColors.textAppColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Author : ${newsModel.author.toString()}',
                          style: TextStyle(
                              color: AppColors.textAppColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
                    Text(
                      'Published-At : ${newsModel.publishedAt.toString()}',
                      style: TextStyle(
                          color: AppColors.textAppColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height*0.03,
                    ),
                    Container(
                      height: height*0.32,
                      child: Text(
                        newsModel.description.toString(),
                        style: TextStyle(
                            color: AppColors.textAppColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebViewSCreen(url: newsModel.url.toString())));
                        },
                        child: Container(
                          height: height*0.05,
                          width: width,
                          color: AppColors.primaryAppColor,
                          child: Center(
                            child: Text(
                              'More Information',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                        ))
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}

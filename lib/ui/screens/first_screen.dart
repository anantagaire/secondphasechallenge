import 'package:flutter/material.dart';
import 'package:phaseiichallenges/ui/styles/colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: ListView.builder(
            itemCount: 10,
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
                              "https://cdn.pixabay.com/photo/2015/09/09/22/07/iron-man-933709_960_720.jpg",
            
                            ),
                            fit: BoxFit.cover
                          )),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

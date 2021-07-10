import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phaseiichallenges/bloc/news_bloc/news_bloc.dart';

import 'bloc/news_bloc/news_event.dart';
import 'ui/screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phase 2 Challenges',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>NewsBloc()..add(FetchNews()))
        ],
        child:  FirstScreen(),
      )
      ,
    );
  }
}
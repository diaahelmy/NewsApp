import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/viewmodel/Business.dart';
import 'package:news_app/viewmodel/Science.dart';
import 'package:news_app/viewmodel/sport.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);


  int currentindex = 0;

  List<BottomNavigationBarItem>bottomItems=[
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_sharp),
        label: 'Business',

    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_outlined),
        label: 'Sport'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'),
  ];
void changeBottomNavBar(int index){
  currentindex = index ;
  emit(NewsBottomNavState());

}
List <Widget>screen = [
  BusinessScreen(),
  SportScreen(),
  ScienceScreen(),
];

}

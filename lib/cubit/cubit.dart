import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/Cache.dart';
import 'package:news_app/viewmodel/Business.dart';
import 'package:news_app/viewmodel/Science.dart';
import 'package:news_app/viewmodel/Settings.dart';
import 'package:news_app/viewmodel/sport.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center_sharp),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_basketball_outlined),
      label: 'Sport',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void changeBottomNavBar(int index) {
    currentindex = index;
    emit(NewsBottomNavState());

    if (index == 0) getBusniess('business');
    if (index == 1) getBusniess('sports');
    if (index == 2) getBusniess('science');
  }

  List<Widget> screen = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBusniess(String category) {
    emit(NewsGetBusniessLodingState());

    List<dynamic> targetList;

    switch (category) {
      case 'business':
        targetList = business;
        break;
      case 'sports':
        targetList = sports;
        break;
      case 'science':
        targetList = science;
        break;
      default:
        targetList = [];
    }
    if (targetList.isEmpty) {
      DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'category': category,
              'apiKey': '72390fa8ef7741dbbebd6b89119de079',
            },
          )
          .then((value) {
            List<dynamic> articles = value.data['articles'];

            switch (category) {
              case 'business':
                business = articles;
                break;
              case 'sports':
                sports = articles;
                break;
              case 'science':
                science = articles;
                break;
            }
            print(value.data['articles'][0]['title']);
            emit(NewsGetSussecState());
          })
          .catchError((error) {
            print(error.toString());
            emit(NewsGetErrorState(error));
          });
    } else {
      emit(NewsGetSussecState());
    }
  }



  void changeThemes({bool? fromSared}) {
    if (fromSared != null) {
      isDark = fromSared;
      emit(ThemeChangedState());
    } else {
      isDark = !isDark;
      print('Changing theme to Dark Mode: $isDark');
      Cache.setData(key: 'isDark', value: isDark).then((onValue) {
        emit(ThemeChangedState());
      }


      );
    }
  }

  // Search
  List<dynamic> search = [];

  void searchArticles(String query) {
    emit(NewsSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': query,
        'apiKey': '72390fa8ef7741dbbebd6b89119de079',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchErrorState(error.toString()));
    });
  }

}

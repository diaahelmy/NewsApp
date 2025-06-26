import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/Listofitemapi.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/Newsapp/SearchLayout.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, Searchlayout());
                },
                icon: Icon(Icons.search),
              ),

              IconButton(
                icon: Icon(Icons.brightness_6_outlined),
                onPressed: () {
                  NewsCubit.get(context).changeThemes();
                  print('object work themes');
                },
              ),
            ],
          ),
          body: cubit.screen[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,

            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}

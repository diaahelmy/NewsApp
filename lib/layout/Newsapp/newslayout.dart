import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusniess('business'),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text('News App'),
            actions: [
             IconButton(onPressed: (){

             }, icon: Icon(Icons.search))
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
      ),
    );
  }
}

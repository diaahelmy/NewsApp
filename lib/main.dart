import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/Newsapp/newslayout.dart';
import 'package:news_app/network/local/Cache.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'cubit/cubit.dart';

void main() async {
  // Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Cache.init();
  bool? isDark = Cache.getData(key: 'isDark');


  runApp(
    BlocProvider(
      create: (context) => NewsCubit()
        ..changeThemes(fromSared: isDark)
        ..getBusniess('business'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
       return BlocConsumer<NewsCubit, NewsStates>(
          builder: (BuildContext context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.amber,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                  elevation: 10.0,
                ),
                textTheme: TextTheme(
                  bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
                  bodyLarge: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: Color(0xFF121212),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.amberAccent,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Color(0xFF1F1F1F),
                  elevation: 10.0,
                ),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: Color(0xFF1F1F1F),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xFF1F1F1F),
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                textTheme: TextTheme(
                  bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
                  bodyLarge: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              themeMode: NewsCubit
                  .get(context)
                  .isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: NewsLayout(),
            );
          },
          listener: (BuildContext context, NewsStates state) {},



    );
  }
}

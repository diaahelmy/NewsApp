abstract class NewsStates{}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusniessLodingState extends NewsStates {}

class NewsGetSussecState extends NewsStates {}

class NewsGetErrorState extends NewsStates {

  final String error;
  NewsGetErrorState(this.error);
}
class NewsGetSportLodingState extends NewsStates {}
class NewsGetScienceLodingState extends NewsStates {}

class ThemeChangedState extends NewsStates {}

class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchErrorState extends NewsStates {
  final String error;
  NewsSearchErrorState(this.error);
}



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/Listofitemapi.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return ConditionalBuilder(
          condition: state is! NewsGetSportLodingState && list.isNotEmpty,
          builder: (context) => listView(list: list),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/Listofitemapi.dart';
import 'package:news_app/cubit/states.dart';

import '../../cubit/cubit.dart';

class Searchlayout extends StatelessWidget {
  Searchlayout({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, NewsStates state) {
        var list = NewsCubit.get(context).search;
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: const Text('Search'),),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controler: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    cubit.searchArticles(value);
                  },
                  prefix: Icons.search,
                  validator: searchIsNull,
                  lable: 'Search',
                ),
              ),
              if (state is NewsSearchLoadingState)
                const LinearProgressIndicator(),
              if (state is! NewsSearchLoadingState)
                Expanded(
                  child: list.isEmpty
                      ? const Center(child: Text('No results found'))
                      : ListView.separated(
                    itemBuilder: (context, index) =>
                        buildArticalItem(list[index],context),
                    separatorBuilder: (context, index) =>
                    const Divider(),
                    itemCount: list.length,
                  ),
                ),
            ],
          ),
        );
      },
      listener: (BuildContext context, NewsStates state) {},
    );
  }

  String? searchIsNull(value) {
    if (value.isEmpty) {
      return 'Search must not be empty';
    }
    return null;
  }
}

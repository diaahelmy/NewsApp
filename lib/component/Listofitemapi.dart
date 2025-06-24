import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

Widget buildArticalItem (article)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Expanded(
        child: Container(
          width:120 ,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                '${article['urlToImage']}',


              ),

              fit: BoxFit.cover,

            ),
          ),
        ),
      ),
      SizedBox(width: 20),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Text('${article['title']} ',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,


                ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('${article['publishedAt']}',style: TextStyle(

                  color: Colors.grey


              ),),
            ],
          ),
        ),
      )
    ],
  ),
);

Widget divier()=>Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[300],
);

Widget listView({required List list}) => ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context, index) => buildArticalItem(list[index]),
  separatorBuilder: (context, index) => divier(),
  itemCount: list.length,
);


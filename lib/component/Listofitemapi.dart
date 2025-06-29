import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../network/webview.dart';

Widget buildArticalItem(article, context) => InkWell(
  onTap: () {
    navigateTo(context, WebviewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),

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
                  child: Text(
                    '${article['title']} ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,height: 1.1,),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  formatDate(article['publishedAt']),
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

String formatDate(String isoDate) {
  final date = DateTime.parse(isoDate).toLocal(); // Local time
  return DateFormat('d MMMM yyyy, hh:mm a').format(date);
}

Widget divier() =>
    Container(width: double.infinity, height: 1, color: Colors.grey[300]);

Widget listView({required List list}) => ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context, index) => buildArticalItem(list[index], context),
  separatorBuilder: (context, index) => divier(),
  itemCount: list.length,
);

Widget defaultFormField({
  Function(String)? onSubmit,
  Function(String)? onChange,
  required TextEditingController controler,
  required TextInputType type,
  String? Function(String?)? validator,
  required IconData prefix,
  required String lable,
  VoidCallback? click,
  bool isClickable = true,
}) => TextFormField(
  controller: controler,
  keyboardType: type,
  onTap: click,
  enabled: isClickable,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validator,
  decoration: InputDecoration(
    labelText: lable,
    prefixIcon: Icon(prefix),
    border: OutlineInputBorder(),
  ),
);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

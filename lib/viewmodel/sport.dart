import 'package:flutter/cupertino.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(
        child: Text('Sport Screen',
          style:TextStyle(
              fontSize: 18 ,
              fontWeight:FontWeight.bold
          )

          ,)
    );
  }
}

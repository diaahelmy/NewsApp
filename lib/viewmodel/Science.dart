import 'package:flutter/cupertino.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Science Screen',
          style:TextStyle(
              fontSize: 18 ,
              fontWeight:FontWeight.bold
          )

          ,)
    );
  }
}

import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Settings Screen',
          style:TextStyle(
              fontSize: 18 ,
              fontWeight:FontWeight.bold
          )

          ,)
    );
  }
}

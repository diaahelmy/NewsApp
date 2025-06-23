import 'package:flutter/cupertino.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget  build(BuildContext context) {
    return Center(
      child: Text('Business Screen',
        style:TextStyle(
          fontSize: 18 ,
          fontWeight:FontWeight.bold
        )

        ,)
    );
  }
}

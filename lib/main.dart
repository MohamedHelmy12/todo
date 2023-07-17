import 'package:flutter/material.dart';

import 'virws/home_view.dart';

void main() {
  runApp( const Todo());
}

class Todo extends StatelessWidget {
   const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,

    );
  }
}

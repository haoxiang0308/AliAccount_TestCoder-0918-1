import 'package:flutter/material.dart';

class HelloFlutterWidget extends StatelessWidget {
  const HelloFlutterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'Hello Flutter!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
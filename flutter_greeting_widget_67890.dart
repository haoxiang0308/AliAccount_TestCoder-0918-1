import 'package:flutter/material.dart';

class FlutterGreeting extends StatelessWidget {
  const FlutterGreeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.waving_hand,
            size: 60,
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text(
            'Hello, Flutter Developer!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to the wonderful world of Flutter!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String greeting;

  const GreetingWidget({Key? key, this.greeting = 'Hello, World!'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        greeting,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
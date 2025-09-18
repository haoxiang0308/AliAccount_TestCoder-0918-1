import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String name;

  const GreetingWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.waving_hand,
            size: 48.0,
            color: Colors.amber,
          ),
          const SizedBox(height: 16.0),
          Text(
            'Hello, $name!',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Welcome to Flutter development!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
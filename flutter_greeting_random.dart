import 'package:flutter/material.dart';

class RandomGreetingWidget extends StatelessWidget {
  const RandomGreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Greeting'),
      ),
      body: Center(
        child: Text(
          'Hello from a randomly named file!',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
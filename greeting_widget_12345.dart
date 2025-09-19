import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String name;

  const GreetingWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome, $name!',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Nice to meet you, $name!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Say Hello'),
            ),
          ],
        ),
      ),
    );
  }
}
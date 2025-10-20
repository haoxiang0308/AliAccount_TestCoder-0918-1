import 'package:flutter/material.dart';

class GreetingDisplay extends StatelessWidget {
  const GreetingDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Flutter',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
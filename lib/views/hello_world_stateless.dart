import 'package:flutter/material.dart';

class HelloWorldStateless extends StatelessWidget {
  const HelloWorldStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World - Stateless'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Hello World!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

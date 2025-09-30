import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'hello_world_stateless.dart';
import 'hello_world_stateful.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Pet Grooming Services',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'We provide professional pet grooming services for your beloved pets.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 30),

          // Using Custom Button Widget (Requirement 4)
          CustomButton(
            text: 'View Stateless Demo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelloWorldStateless(),
                ),
              );
            },
            backgroundColor: Colors.green,
            width: double.infinity,
          ),

          const SizedBox(height: 16),

          // Using Custom Button Widget again (Requirement 4)
          CustomButton(
            text: 'View Stateful Demo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelloWorldStateful(),
                ),
              );
            },
            backgroundColor: Colors.blue,
            width: double.infinity,
          ),

          const Spacer(),

          const Center(
            child: Text(
              '🐕 Happy Pets, Happy Owners! 🐱',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

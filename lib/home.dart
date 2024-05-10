import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white.withOpacity(0.7),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter !',
            style: TextStyle(
              // decoration: TextDecoration.none,
              fontSize: 24,
              color: Colors.white.withOpacity(0.7),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white.withOpacity(0.7),
            ),
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
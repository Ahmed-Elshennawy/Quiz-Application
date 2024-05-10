import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'dart:developer';
import 'question.dart';
import 'result.dart';
import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = Result(selectedAnswer, restart);
      });
    }
    log(selectedAnswer.toString());
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = Home(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurpleAccent,
            Colors.purple,
          ])),
          child: activeScreen,
        ),
      ),
    );
  }
}

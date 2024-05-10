import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_button.dart';
import 'data/questions.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});
  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionsState();
}

class _QuestionsState extends State<Question> {
  var currentQuestionIndex = 0;
  void answerQuestion(answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          // ...currentQuestion.getShuffledAnswers().map(
          ...currentQuestion.getShuffledAnswers.map(
            (e) {
              return Container(
                margin: const EdgeInsets.all(7),
                child: AnswerButton(
                  answerText: e,
                  onPressed: () => answerQuestion(e),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

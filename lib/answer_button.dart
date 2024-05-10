import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onPressed,
  });

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(0),
        // ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple[900],
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}

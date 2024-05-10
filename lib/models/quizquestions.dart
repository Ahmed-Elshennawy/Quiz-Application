class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get getShuffledAnswers{
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    //copied the original list of answers and suffled it
    final shuffledList = List.of(answers); //??
    shuffledList.shuffle();
    return shuffledList;
  }
}

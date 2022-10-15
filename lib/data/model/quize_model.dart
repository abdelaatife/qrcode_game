class Quiz {
  final String text;
  final List<Option> options;
  bool islocked;
  Option? selectoption;
  Quiz({
    required this.text,
    required this.options,
    this.islocked = false,
    this.selectoption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  Option(
      {required this.text,
      required this.isCorrect});
}

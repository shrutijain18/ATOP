import 'package:flutter/material.dart';

import './questions.dart';
import './answers.dart';

class Survey extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Survey(
    this.questions,
    this.questionIndex,
    this.answerQuestion,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionText(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(
              answerQuestion, answer, questions[questionIndex]['questionText']);
        }).toList()
      ],
    );
  }
}

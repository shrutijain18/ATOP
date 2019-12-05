import 'package:flutter/material.dart';

import './questions.dart';
import './answers.dart';
import './questionsNavigator.dart';

class Survey extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final String radioGroupValue;
  final Function navigateQuestion;

  Survey(this.questions, this.questionIndex, this.answerQuestion,
      this.radioGroupValue, this.navigateQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        QuestionText(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer, radioGroupValue);
        }).toList(),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Questionsnavigator("Previous", navigateQuestion),
                Questionsnavigator("Next", navigateQuestion),
              ],
            ),
          ),
        )
      ],
    );
  }
}

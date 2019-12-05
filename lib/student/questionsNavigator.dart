import 'package:flutter/material.dart';
import 'package:quiz_project/student/questions.dart';

class Questionsnavigator extends StatelessWidget {
  final String buttonLabel;
  final Function navigateQuestions;
  Questionsnavigator(this.buttonLabel, this.navigateQuestions);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new RaisedButton(
          onPressed: () {
            navigateQuestions();
          },
          textColor: Colors.white,
          color: Colors.blue,
          padding: const EdgeInsets.all(8.0),
          child: new Text(buttonLabel),
        ),
      ],
    );
  }
}

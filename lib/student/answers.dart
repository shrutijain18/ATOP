import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  final String questionText;
  Answer(this.selectHandler, this.answerText, this.questionText);
  @override
  Widget build(BuildContext context) {
    var container = Container(
        width: double.infinity,
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
                title: Text(answerText),
                leading: Radio(
                    value: answerText,
                    groupValue: 'answerOptions',
                    onChanged: (val) {
                      selectHandler(questionText, val);
                    })),
          ],
        ));
    return container;
  }
}

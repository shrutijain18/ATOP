import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

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
                    print(val);
                    selectHandler(val);
                  },
                )),
          ],
        ));
    return container;
  }
}

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  final String groupTextValue;

  Answer(this.selectHandler, this.answerText, this.groupTextValue);

  @override
  Widget build(BuildContext context) {
    var container = Container(
        width: double.infinity,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile(
              title: Text(answerText),
              value: answerText,
              groupValue: groupTextValue,
              activeColor: Colors.blue,
              onChanged: (val) {
                selectHandler(val);
              },
            ),
          ],
        ));
    return container;
  }
}

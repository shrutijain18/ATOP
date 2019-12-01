import 'package:flutter/material.dart';

import './questions.dart';
import './answers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State {
  var _questionIndex = 0;
  Widget getTextWidgets(List<String> strings) {
    return new Column(
      children: strings
          .map((item) => new Text(item, textAlign: TextAlign.left))
          .toList(),
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  void _answerQuestion(val) {
    print(val);
    setState(() {
      _questionIndex++;
    });
    //  print("Answer chosen!!");
    print(_questionIndex);
    // return _questionIndex;
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText':
            'Please rate your overall satisfaction with your Professor.',
        'answers': [
          'Very Satisfied',
          'Dissatisfied',
          'Neutral',
          'Satisfied',
          'Very Satisfied'
        ],
      },
      {
        'questionText': 'Explained course objectives clearly',
        'answers': ['1', '2', '3', '4', '5'],
      },
      {
        'questionText': 'Was prepared for each class',
        'answers': ['1', '2', '3', '4', '5'],
      },
      {
        'questionText': 'Maintained positive classroom environment',
        'answers': ['1', '2', '3', '4', '5'],
      },
      {
        'questionText': 'Made class enjoyable as well as educational',
        'answers': ['1', '2', '3', '4', '5'],
      },
      {
        'questionText': 'Communicated clearly',
        'answers': ['1', '2', '3', '4', '5'],
      },
      {
        'questionText': 'Communicated candidly and constructively',
        'answers': ['1', '2', '3', '4', '5'],
      },
      {
        'questionText': 'Showed expertise in the subject matter',
        'answers': ['1', '2', '3', '4', '5'],
      },
      {
        'questionText': 'Was current with developments in field',
        'answers': ['1', '2', '3', '4', '5'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            QuestionText(_questions[_questionIndex]['questionText']),

            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()

            // Answer(_answerQuestion, "yes"),
            //Answer(_answerQuestion, "no")
          ],
        ),
      ),
    );
  }
}

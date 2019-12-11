import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../home/homeScreen.dart';

import './surveyQuestions.dart';

class Studentmainscreen extends StatefulWidget {
  final String classCode;

  Studentmainscreen(this.classCode);

  @override
  _StudentmainscreenState createState() => _StudentmainscreenState(classCode);
}

class _StudentmainscreenState extends State<Studentmainscreen> {
  var responseToSaveToDatabase = new Map();

  final _questions = [
    {
      'questionText':
          'Please rate your overall satisfaction with your Professor',
      'answers': [
        'Very Satisfied',
        'Satisfied',
        'Neutral',
        'Dissatisfied ',
        'Very Dissatisfied'
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
  GlobalKey<FormState> _key = new GlobalKey();
  final String classCode;

  _StudentmainscreenState(this.classCode);

  var _questionIndex = 0;
  void _answerQuestion(questionText, val) {
    print(questionText);
    print(val);
    //responseToSaveToDatabase[questionText] = val;
    setState(() {
      responseToSaveToDatabase[questionText] = val;
      _questionIndex++;
    });
    print(responseToSaveToDatabase);
    // print("abc" + this.classCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Course Survey'),
            centerTitle: true,
          ),
          body: _questionIndex < _questions.length
              ? Survey(_questions, _questionIndex, _answerQuestion)
              : Center(
                  child: RaisedButton(
                    onPressed: () {
                      //print('YOU CANT HANDLE THE TRUTH');
                      //print(responseToSaveToDatabase);
                      var newString = classCode.split(" ");
                      responseToSaveToDatabase['Course-Number'] = newString[0];
                      responseToSaveToDatabase['ProfessorName'] =
                          newString[1] + " " + newString[2];

                      DatabaseReference ref =
                          FirebaseDatabase.instance.reference();

                      ref
                          .child('node-name')
                          .push()
                          .set(responseToSaveToDatabase)
                          .then((v) {
                        _key.currentState.reset();
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homescreen()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Tap to Submit',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center),
                    ),
                  ),
                )),
    );
  }
}

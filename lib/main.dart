import 'package:flutter/material.dart';
import 'home/homeScreen.dart';

/*import './student/surveyQuestions.dart';*/

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: new ThemeData(
      primaryColor: Colors.blue,
    ),
    home: Homescreen(),
  ));
}

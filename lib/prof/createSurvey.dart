import 'package:flutter/material.dart';
import 'renderQRCode.dart';

// Create a Form widget.
class CreateSurvey extends StatefulWidget {
  @override
  SurveyState createState() {
    return SurveyState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SurveyState extends State<CreateSurvey> {
  String dept;
  String course;
  String section;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Survey'), centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.input),
                hintText: 'DEPT',
                labelText: 'Department',
              ),
              onSaved: (String value) {
                dept = value;
                // Save DEPT in database?
              },
              validator: (String value) {
                return value.isEmpty ? 'Field is required' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.input),
                hintText: '1010',
                labelText: 'Course',
              ),
              onSaved: (String value) {
                // Save course in databse
                course = value;
              },
              validator: (String value) {
                return value.isEmpty ? 'Field is required' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.input),
                hintText: 'Section',
                labelText: '201',
              ),
              onSaved: (String value) {
                // Save section in database
                section = value;
                print('saved $section');
              },
              validator: (String value) {
                return value.isEmpty ? 'Field is required' : null;
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  _formKey.currentState.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RenderQRCode(dept, course, section)),
                  );
                }
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
                child: const Text('Generate QR Code',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:firebase_database/firebase_database.dart';
import '../admin/subscriber_chart.dart';
import '../admin/subscriber_series.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage>{
    List<SubscriberSeries> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('node-name').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        SubscriberSeries d = new SubscriberSeries(
        year: data[key]['Communicated clearly'],
        subscribers: int.parse(data[key]['Communicated clearly']),
        barColor: charts.ColorUtil.fromDartColor (Colors.blue),
      );
      allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SubscriberChart(
          data: allData,
        ),
      ),
    );
  }
}
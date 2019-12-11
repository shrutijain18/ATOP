import 'package:flutter/material.dart';
import '../admin/subscriber_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;
  SubscriberChart({@required this.data});

  @override 
  Widget build(BuildContext context) {
    var series2 = charts.Series(
        id: "Sub",
        data: data,
        domainFn: (SubscriberSeries series, _) =>
        series.year,
        measureFn: (SubscriberSeries series, _) =>
        series.subscribers,
        colorFn: (SubscriberSeries series, _) =>
        series.barColor);
    List<charts.Series<SubscriberSeries, String>> series
    = [
      series2
    ];

        return Container (
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Professors analysis for Clear Communication",
                style: Theme.of(context).textTheme.body2,
              ),
              Expanded(
                child: charts.BarChart(series, animate:true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
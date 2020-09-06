import 'package:charts_flutter/flutter.dart' as charts;

class ChartModel {
  final String month;
  final int followers;
  final charts.Color barColor;
  ChartModel({
    this.month,
    this.followers,
    this.barColor,
  });
}

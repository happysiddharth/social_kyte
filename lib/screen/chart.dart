import 'package:flutter/cupertino.dart';
import 'package:socialkyte/model/chartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FollowersChart extends StatelessWidget {
  final List<ChartModel> data;
  FollowersChart({
    this.data,
  });
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartModel, String>> series = [
      charts.Series(
        id: "Followers",
        data: data,
        domainFn: (ChartModel seriers, _) => seriers.month.toUpperCase(),
        measureFn: (ChartModel series, _) => series.followers,
        colorFn: (ChartModel series, _) => series.barColor,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}

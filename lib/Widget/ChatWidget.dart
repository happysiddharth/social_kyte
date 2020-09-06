import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialkyte/model/chartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:socialkyte/provider/followersProvider.dart';

import 'package:socialkyte/screen/chart.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  List<ChartModel> item = [];
  @override
  Widget build(BuildContext context) {
    final Followers_provider = Provider.of<FollowersProvider>(context);
    Followers_provider.formatDataToFitIntoGraph().forEach((month, list) {
      if (list.length > 1) {
        item.add(ChartModel(
          month: month,
          barColor: charts.ColorUtil.fromDartColor(Colors.red),
          followers: list.length,
        ));
      }
    });
    return FollowersChart(
      data: item,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:socialkyte/model/chartModel.dart';
import 'package:socialkyte/model/follower.dart';

class FollowersProvider with ChangeNotifier {
  List<Follower> _item = [
    Follower(
      followerUserName: "ravikumar",
      timeOfFollower: DateTime.now(),
      id: "1",
      userId: "1",
      profilePic:
          'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg',
    ),
    Follower(
      followerUserName: "shubham",
      timeOfFollower: DateTime.now(),
      id: "2",
      userId: "2",
      profilePic:
          'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg',
    ),
    Follower(
      followerUserName: "tarun",
      timeOfFollower: DateTime.now(),
      id: "3",
      userId: "3",
      profilePic:
          'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg',
    ),
  ];

  List<Follower> get item {
    return [..._item];
  }

  Map<String, List<ChartModel>> formatDataToFitIntoGraph() {
    Map<String, List<ChartModel>> mp = {
      "Jan": [],
      "Feb": [],
      "March": [],
      "April": [],
      "May": [],
      "Jun": [],
      "July": [],
      "Aug": [],
      "Sep": [],
      "Oct": [],
      "Nov": [],
      "Dec": []
    };
    _item.forEach((d) {
      print(DateFormat("MMM").format(d.timeOfFollower).toString());
      mp[DateFormat("MMM").format(d.timeOfFollower).toString()].add(ChartModel(
        month: DateFormat("MMM").format(d.timeOfFollower).toString(),
      ));
    });
    return mp;
  }

  Future fetch() async {}
}

import 'package:flutter/cupertino.dart';

import 'package:socialkyte/model/following.dart';

class FolloweringProvider with ChangeNotifier {
  List<Following> _item = [
    Following(
      followerUserName: "rajeev",
      timeOfFollower: DateTime.now(),
      id: "1",
      userId: "1",
      profilePic:
          'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg',
    ),
    Following(
      followerUserName: "sanju",
      timeOfFollower: DateTime.now(),
      id: "2",
      userId: "2",
      profilePic:
          'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg',
    ),
    Following(
      followerUserName: "ravi",
      timeOfFollower: DateTime.now(),
      id: "3",
      userId: "3",
      profilePic:
          'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg',
    ),
    Following(
      followerUserName: "tanmay",
      timeOfFollower: DateTime.now(),
      id: "4",
      userId: "4",
      profilePic:
          'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg',
    ),
  ];

  List<Following> get item {
    return [..._item];
  }

  Future fetch() async {}
}

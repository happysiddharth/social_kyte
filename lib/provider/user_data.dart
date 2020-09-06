import 'package:flutter/cupertino.dart';
import 'package:socialkyte/model/user_model.dart';

class UserData with ChangeNotifier {
  ParticularUser user = new ParticularUser();
  Future fetch(String id) {
    user.id = "1";
    user.followersCount = 20;
    user.name = "Siddharth Kaushik";
    user.bio = "Software Engineer at Google Inc.";
    user.followingCount = 10;
    // notifyListeners();
  }
}

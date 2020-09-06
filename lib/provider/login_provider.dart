import 'package:flutter/cupertino.dart';
import 'package:socialkyte/model/logined_user.dart';

class LoginProvider with ChangeNotifier {
  String username = User.username;
  String password = User.password;

  bool isLogin = false;

  Future<bool> login(String entered_username, String entered_password) async {
    print(entered_username + " " + entered_username);
    if (username.toLowerCase() == entered_username.toLowerCase() &&
        password == entered_password) {
      return true;
    } else {
      return false;
    }
  }
}

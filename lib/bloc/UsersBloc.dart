import 'package:flutter/material.dart';
import 'package:state_management_tests/models/user.dart';

class UserBloc extends ChangeNotifier {
  User _user = User(
    "Test",
    "Password",
    Image.asset("images/8314104-1x1-940x940.jpg"),
  );
  User get user => _user;

  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}

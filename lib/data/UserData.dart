import 'package:flutter/material.dart';
import 'package:state_management_tests/models/user.dart';

List<User> getUser() {
  List<User> users = [
    User(
      "Keaton",
      "password",
      Image.asset("images/Keaton_profile.jpg"),
    ),
    User(
      "John",
      "password",
      Image.asset("images/avat-01-512.png"),
    ),
  ];
  return users;
}

User checkUser(String username, String password) {
  print("Name: $username, Password: $password");
  return getUser().firstWhere(
    (user) => (user.name == username && user.password == password),
    orElse: () => User.nullUser(),
  );
}

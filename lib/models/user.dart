import 'package:flutter/material.dart';

class User {
  User(
    this.name,
    this.password,
    this.profilePic,
  );
  final Image profilePic;
  final String name;
  final String password;
  User.nullUser() : 
    name = null,
    password = null,
    profilePic = null;
}

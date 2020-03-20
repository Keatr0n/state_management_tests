import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tests/bloc/UsersBloc.dart';
import 'package:state_management_tests/models/user.dart';
import 'package:state_management_tests/screens/ChangeUserScreen.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = Provider.of<UserBloc>(context);
    final User user = userBloc.user;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(30),
                  child: Hero(
                    tag: "profile",
                    child: CircleAvatar(
                      backgroundImage: user.profilePic.image,
                      radius: 60,
                    ),
                  ),
                ),
                Text(
                  user.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeUserScreen(),
                      ),
                    ),
                    child: Text(
                      "Change User",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

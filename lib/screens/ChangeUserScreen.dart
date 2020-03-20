import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tests/bloc/UsersBloc.dart';
import 'package:state_management_tests/data/UserData.dart';

class ChangeUserScreen extends StatelessWidget {
  final TextEditingController usernameInputControler = TextEditingController();
  final TextEditingController passwordInputControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Hero(
                tag: "profile",
                child: CircleAvatar(
                  backgroundImage: userBloc.user.profilePic.image,
                  radius: 40,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                ),
                style: TextStyle(fontSize: 24),
                controller: usernameInputControler,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                ),
                style: TextStyle(fontSize: 24),
                controller: passwordInputControler,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    userBloc.user = checkUser(
                      usernameInputControler.value.text,
                      passwordInputControler.value.text,
                    );
                    usernameInputControler.clear();
                    passwordInputControler.clear();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

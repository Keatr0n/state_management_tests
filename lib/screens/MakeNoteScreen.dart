import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tests/bloc/UsersBloc.dart';
import 'package:state_management_tests/models/note.dart';
import 'package:state_management_tests/screens/ListNoteScreen.dart';
import 'package:state_management_tests/bloc/NoteBloc.dart';
import 'package:state_management_tests/screens/UserScreen.dart';

class MakeNoteScreen extends StatelessWidget {
  final TextEditingController titleInputControler = TextEditingController();
  final TextEditingController bodyInputControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteBloc noteBloc = Provider.of<NoteBloc>(context);
    final UserBloc userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserScreen(),
                  ),
                ),
                child: Hero(
                  tag: "profile",
                  child: CircleAvatar(
                    backgroundImage: userBloc.user.profilePic.image,
                    radius: 50,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                ),
                style: TextStyle(fontSize: 24),
                controller: titleInputControler,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                minLines: 3,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Note",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                ),
                style: TextStyle(fontSize: 24),
                controller: bodyInputControler,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    noteBloc.addNote(Note(
                      noteBloc.notes.length.toString(),
                      titleInputControler.value.text,
                      bodyInputControler.value.text,
                    ));
                    titleInputControler.clear();
                    bodyInputControler.clear();
                  },
                  child: Text(
                    "Add note",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListNoteScreen(),
                    ),
                  ),
                  child: Text(
                    "View Notes",
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

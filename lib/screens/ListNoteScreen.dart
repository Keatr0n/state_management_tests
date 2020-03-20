import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tests/bloc/NoteBloc.dart';
import 'package:state_management_tests/screens/ViewNoteScreen.dart';

class ListNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NoteBloc noteBloc = Provider.of<NoteBloc>(context);

    List<Widget> orders = [];

    for (var i = 0; i < noteBloc.notes.length; i++) {
      orders.add(
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewNoteScreen(noteBloc.notes[i].id),
            ),
          ),
          child: Hero(
            tag: noteBloc.notes[i].id,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      noteBloc.notes[i].title,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => noteBloc.removeNote(noteBloc.notes[i].id),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              margin: EdgeInsets.all(20),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: orders,
      ),
    );
  }
}

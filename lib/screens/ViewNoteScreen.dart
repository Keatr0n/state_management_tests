import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tests/bloc/NoteBloc.dart';
import 'package:state_management_tests/models/note.dart';

class ViewNoteScreen extends StatelessWidget {
  ViewNoteScreen(this.id);
  final String id;
  @override
  Widget build(BuildContext context) {
    final NoteBloc noteBloc = Provider.of<NoteBloc>(context);
    Note note = noteBloc.getNoteById(id);
    return Scaffold(
      body: Hero(
        tag: id,
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      note.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Navigator.of(context).pop();
                      noteBloc.removeNote(note.id);
                    },
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: Text(
                  note.body,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }
}

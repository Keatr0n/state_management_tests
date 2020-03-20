import 'package:flutter/material.dart';
import 'package:state_management_tests/models/note.dart';

class NoteBloc extends ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  set notes(List<Note> newNotes) {
    _notes = newNotes;
    notifyListeners();
  }

  void addNote(Note newNote) {
    _notes.add(newNote);
    notifyListeners();
  }

  Note getNoteById(String id) {
    return _notes.firstWhere((note)=>note.id == id);
  }

  void removeNote(String id) {
    _notes.removeAt(_notes.indexWhere((note)=>id==note.id));
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tests/bloc/UsersBloc.dart';
import 'package:state_management_tests/screens/MakeNoteScreen.dart';

import 'bloc/NoteBloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteBloc>.value(
          value: NoteBloc(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.lightBlue[300]),
        home: MakeNoteScreen(),
      ),
    );
  }
}

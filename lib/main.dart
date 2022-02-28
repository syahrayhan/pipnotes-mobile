import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pipnotes/main_screen.dart';

void main() {
  runApp(PipNotes());
}

class PipNotes extends StatelessWidget {
  const PipNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Pipnotes",
      theme: ThemeData.dark(),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

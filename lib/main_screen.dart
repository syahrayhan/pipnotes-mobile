import 'package:flutter/material.dart';
import 'package:pipnotes/models/notes_model.dart';
import 'package:pipnotes/note_screen.dart';
import 'package:pipnotes/widgets/dialog.dart';
import 'package:pipnotes/widgets/pip_icons_icons.dart';

var isNoteAvailable = true;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void navigateToNoteScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NoteScreen(titleValue: "", descValue: ""),
      ),
    );
    setState(() {
      if (noteList.isNotEmpty) {
        isNoteAvailable = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(height);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Header(),
            Body(width: width, height: height),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToNoteScreen(context);
        },
        child: const Icon(
          PipIcons.add,
          color: Colors.white,
          size: 48,
        ),
        backgroundColor: Color(0xff252525),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    if (noteList.isEmpty) {
      isNoteAvailable = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: widget.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: isNoteAvailable,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: noteList.length,
                  itemBuilder: (context, index) {
                    var noteData = noteList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NoteScreen(
                                titleValue: "a", descValue: "a"),
                          ),
                        );
                      },
                      child: Container(
                        width: widget.width,
                        padding:
                            EdgeInsets.symmetric(vertical: 22, horizontal: 27),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffFD99FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${noteData.title}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: !isNoteAvailable,
                child: Column(
                  children: [
                    SizedBox(
                      height: widget.height * 0.25,
                    ),
                    Image.asset(
                      "assets/images/rafiki.png",
                      width: 250,
                    ),
                    const Text(
                      "Create your first note !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: widget.height * 0.25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Title(),
          ActionMenu(),
        ],
      ),
    );
  }
}

class ActionMenu extends StatelessWidget {
  const ActionMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xff3B3B3B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              PipIcons.search,
              size: 24.0,
            ),
          ),
        ),
        SizedBox(width: 22),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff3B3B3B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return InfoDialog();
                },
              );
            },
            icon: const Icon(
              PipIcons.info_outline,
              size: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Pipnotes",
      style: TextStyle(
        fontSize: 43,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

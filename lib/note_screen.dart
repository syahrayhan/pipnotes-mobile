import 'package:flutter/material.dart';
import 'package:pipnotes/models/notes_model.dart';
import 'package:pipnotes/widgets/pip_icons_icons.dart';

var title = "";
var desc = "";
var isSaveActive = true;

class NoteScreen extends StatelessWidget {
  final String titleValue;
  final String descValue;
  const NoteScreen(
      {Key? key, required this.titleValue, required this.descValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Header(),
            Body(
              width: width,
              titleBody: titleValue,
              descBody: descValue,
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.width,
    required this.titleBody,
    required this.descBody,
  }) : super(key: key);

  final double width;
  final String titleBody;
  final String descBody;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var isReadOnly = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.titleBody.trim().isEmpty && widget.descBody.trim().isEmpty) {
      setState(() {
        isReadOnly = false;
      });
    }
    if (widget.titleBody.trim().isNotEmpty ||
        widget.descBody.trim().isNotEmpty) {
      setState(() {
        isSaveActive = false;
      });
    } else {
      setState(() {
        isSaveActive = true;
      });
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
              TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: null,
                readOnly: isReadOnly,
                initialValue: widget.titleBody.trim(),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                scrollPhysics: const ScrollPhysics(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                style: TextStyle(
                  fontSize: 48.0,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 1,
                maxLines: null,
                initialValue: widget.descBody.trim(),
                readOnly: isReadOnly,
                onChanged: (value) {
                  setState(() {
                    desc = value;
                  });
                },
                scrollPhysics: const ScrollPhysics(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type something...",
                ),
                style: TextStyle(
                  fontSize: 23.0,
                  fontFamily: 'Nunito',
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
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xff3B3B3B),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                PipIcons.chevron_left,
                size: 32.0,
              ),
            ),
          ),
          Visibility(
            visible: isSaveActive,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff3B3B3B),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                  if (title.trim().isNotEmpty || desc.toString().isNotEmpty) {
                    noteList.add(NotesModel(title: title, desc: desc));
                    Navigator.pop(context);
                  }
                  title = "";
                  desc = "";
                  isSaveActive = false;
                },
                icon: const Icon(
                  PipIcons.save,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

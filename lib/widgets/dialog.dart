import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        height: 236,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  "Designed by Figma Community",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Nunito',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Redesigned by Rayhan Aswiansyah",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Nunito',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Font Nunito",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Nunito',
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
            Text('Made by Rayhan Aswiansyah'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ConverterOptionRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  ConverterOptionRow(
      {@required this.title, @required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {print('BATATA')},
      splashColor: color,
      highlightColor: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

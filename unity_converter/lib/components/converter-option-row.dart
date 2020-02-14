import 'package:flutter/material.dart';

class ConverterOptionRow extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final Function onPress;

  ConverterOptionRow({
    @required this.title,
    @required this.image,
    @required this.color,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      splashColor: color,
      highlightColor: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Hero(
              tag: image,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/icons/$image.png'),
              ),
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

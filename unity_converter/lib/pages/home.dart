import 'package:flutter/material.dart';
import 'package:unity_converter/components/converter-option-row.dart';

class HomePage extends StatelessWidget {
  final categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  final baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UNITY CONVERTER'),
        backgroundColor: Color.fromRGBO(200, 59, 59, 1),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ConverterOptionRow(
              color: baseColors[index],
              title: categoryNames[index],
              icon: Icons.today,
            );
          },
          itemCount: categoryNames.length,
        ),
      ),
    );
  }
}

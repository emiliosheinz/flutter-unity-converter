import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unity_converter/components/converter-option-row.dart';
import 'package:unity_converter/models/category.dart';
import 'package:unity_converter/models/unit.dart';
import 'package:unity_converter/pages/calculate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories;
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

  _loadPageData() async {
    final json = await DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');

    final jsonData = JsonDecoder().convert(json);

    List<CategoryModel> categoriesList = [];
    jsonData.keys.forEach((key) {
      List<UnitModel> unitiesList = [];

      jsonData[key].forEach((obj) {
        unitiesList.add(UnitModel.fromJson(obj));
      });

      categoriesList.add(
        CategoryModel(name: key, unities: unitiesList),
      );
    });

    setState(() {
      categories = categoriesList;
    });
  }

  @override
  void initState() {
    super.initState();

    _loadPageData();
  }

  _renderContent() {
    if (categories != null) {
      return Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            var itemName = categories[index].name;
            var imageName = itemName.toLowerCase().replaceAll(' ', '_');

            return ConverterOptionRow(
              color: baseColors[index],
              title: itemName,
              image: imageName,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculatePage(),
                  ),
                );
              },
            );
          },
          itemCount: categories.length,
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UNITY CONVERTER'),
        backgroundColor: Color.fromRGBO(200, 59, 59, 1),
      ),
      body: _renderContent(),
    );
  }
}

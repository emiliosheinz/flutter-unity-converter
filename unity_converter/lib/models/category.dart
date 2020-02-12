import 'package:flutter/material.dart';
import 'package:unity_converter/models/unit.dart';

class CategoryModel {
  String name;
  List<UnitModel> unities;

  CategoryModel({@required name, @required List<UnitModel> unities})
      : unities = unities,
        name = name;
}

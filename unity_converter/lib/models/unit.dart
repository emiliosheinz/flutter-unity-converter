class UnitModel {
  String name;
  double conversion;

  UnitModel.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        conversion = jsonMap['conversion'].toDouble();
}

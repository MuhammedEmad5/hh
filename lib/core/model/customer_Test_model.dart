import 'dart:convert';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'business_model.dart';

class Customer implements BusinessModel {
  int id1;
  int id2;
  int id3;
  String name;
  int age;

  Customer(
      {required this.id1,
      required this.id2,
      required this.id3,
      required this.name,
      required this.age});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id1: json['id1'] as int,
      id2: json['id2'] as int,
      id3: json['id3'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id1': id1,
      'id2': id2,
      'id3': id3,
      'name': name,
      'age': age,
    };
  }

  static Customer fromJsonString(String jsonString) {
    final jsonData = jsonDecode(jsonString);
    return Customer.fromJson(jsonData);
  }

  String toJsonString() {
    final jsonData = this.toJson();
    return jsonEncode(jsonData);
  }

  @override
  String toString() {
    return 'Customer{id1: $id1,id2: $id2,id3: $id3, name: $name, age: $age}';
  }

  List<String> columnNames = [
    'id1',
    'id2',
    'id3',
    'name',
    'age',
  ];

  List<String> getColumnNames() => columnNames;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<int>(columnName: columnNames[0], value: id1),
      DataGridCell<int>(columnName: columnNames[1], value: id2),
      DataGridCell<int>(columnName: columnNames[2], value: id3),
      DataGridCell<String>(columnName: columnNames[3], value: name),
      DataGridCell<int>(columnName: columnNames[4], value: age),
    ]);
  }
}

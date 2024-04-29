import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../../core/model/business_model.dart';

part 'product_classification_entity.g.dart';

@JsonSerializable()
class ProductClassification implements BusinessModel {
  num productClassification;
  num? parent;

  String? arabicName;
  String? englishName;

  ProductClassification(
      {
        required this.productClassification,
       this.parent,
       this.arabicName,
       this.englishName
      });
  @override
  factory ProductClassification.fromJson(Map<String, dynamic> json) =>
      _$ProductClassificationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductClassificationToJson(this);

  @override
  List<String> getColumnNames() => [
        'productClassification',
        'parent',
        'arabicName',
        'englishName',
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(columnName: "productClassification", value: productClassification),
      DataGridCell<num>(
          columnName: "parent", value: parent),
      DataGridCell<String>(columnName: 'arabicName', value: arabicName),
      DataGridCell<String>(columnName: 'englishName', value: englishName),

    ]);
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../../../core/model/business_model.dart';

part 'branch_model.g.dart';

@JsonSerializable()
class Branch implements BusinessModel {
  final int branchNumber;
  final String? customerNumber;

  final String arabicName;
  final String? arabicDescription;

  final String? englishName;
  final String? englishDescription;
  final String? note;
  final String? address;

  Branch({
    required this.branchNumber,
    this.customerNumber,
    required this.arabicName,
    this.arabicDescription,
    this.englishName,
    this.englishDescription,
    this.note,
    this.address,
  });

  @override
  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BranchToJson(this);

  @override
  List<String> getColumnNames() => [
        'branchNumber',
        'customerNumber',
        'arabicName',
        'arabicDescription',
        'englishName',
        'englishDescription',
        'note',
        'address'
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(columnName: 'branchNumber', value: branchNumber),
      DataGridCell<String>(columnName: 'customerNumber', value: customerNumber),
      DataGridCell<String>(columnName: 'arabicName', value: arabicName),
      DataGridCell<String>(
          columnName: 'arabicDescription', value: arabicDescription),
      DataGridCell<String>(columnName: 'englishName', value: englishName),
      DataGridCell<String>(
          columnName: 'englishDescription', value: englishDescription),
      DataGridCell<String>(columnName: 'note', value: note),
      DataGridCell<String>(columnName: 'address', value: address),
    ]);
  }
}

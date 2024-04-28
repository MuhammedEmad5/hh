import 'package:syncfusion_flutter_datagrid/datagrid.dart';

abstract class MainModel {
  Map<String, dynamic> toJson();
  List<String> getColumnNames();
  DataGridRow getDataGridRow();
}

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'json_model.dart';

abstract class BusinessModel extends JsonModel{
  List<String> getColumnNames();
  DataGridRow getDataGridRow();
}

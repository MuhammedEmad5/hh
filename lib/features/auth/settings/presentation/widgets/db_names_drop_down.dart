import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';

class DbNamesDropDown extends StatelessWidget {
  final List<String> names;
  final CustomDropdownController dbNamesDropDownController;
  const DbNamesDropDown({super.key, required this.names, required this.dbNamesDropDownController});

  @override
  Widget build(BuildContext context) {
    dbNamesDropDownController.value = names[0];







    return CustomDropdownWithController(
      title: "Database Name",
      controller: dbNamesDropDownController,
      titleColor: Colors.white,
      items: names.map((name) {
        return DropdownMenuItem(
          value: name,
          child: Text(name),
        );
      }).toList(),
      onChanged: (value) {
        // LoggerSingleton.logger.i(dbNamesDropDownController.value);
      },
    );  }
}

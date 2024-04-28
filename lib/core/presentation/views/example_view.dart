import 'package:flutter/material.dart';
import '../../enums/date_time_enum.dart';
import '../../model/customer_Test_model.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/app_bar.dart';
import '../widgets/cancel_button.dart';
import '../widgets/checkbox.dart';
import '../widgets/data_grid.dart';
import '../widgets/date_picker.dart';
import '../widgets/dropdown.dart';
import '../widgets/dropdown_search.dart';
import '../widgets/form_navigation.dart';
import '../widgets/label.dart';
import '../widgets/nubmer_box.dart';
import '../widgets/ok_alert.dart';
import '../widgets/submit_button.dart';
import '../widgets/toast_notification.dart';
import '../widgets/text_box.dart';

class ExampleView extends StatefulWidget {
  const ExampleView({super.key});

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  int currentIndex = 1;
  bool? checked = false;
  SubmitButtonController controller = SubmitButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Widgets Example',
        showBack: false, // Optional (Default true)
        showSettings: true, // Optional (Default false)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 10,
              ),
              TextBox(
                initialValue: 'Initial Value', // Optional
                label: 'Label Text box', // Optional
                hint: 'Text box hint', // Optional
                keyboardType: TextInputType.text, // Optional
                maxLength: 25, // Optional
                maxLines: 1, // Optional (To make it multi line)
                onChanged: (value) {
                  print(value);
                }, // Optional
                // controller: , //Optional
              ),
              const SizedBox(
                height: 10,
              ),
              NumberBox(
                // controller: , // Optional
                initialValue: '123', // Optional
                maxLength: 3, // Optional
                width: null, // Optional
                // controller: , // Optional
                onChanged: (value) {
                  print(value);
                }, // Optional
              ),
              const SizedBox(
                height: 10,
              ),
              const Label(
                text: 'Custom Label Text',
                color: Colors.blueAccent, //Optional
                size: 18, // Optional
                textAlign: TextAlign.start, //Optional
                weight: FontWeight.w600, // Optional
              ),
              const SizedBox(
                height: 10,
              ),
              DropDown(
                initialValue: 'Item 1', // Optional
                items: const ['Item 1', 'Item 2', 'lorem', 'ipsum'],
                onChanged: (value) {
                  print(value);
                },
                width: 200, // Optional
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownSearch(
                width: 200, // Optional
                initialValue: 'Item 2', // Optional
                onChanged: (value) {
                  print(value);
                },
                items: const [
                  'Item 1',
                  'Item 2',
                  'blabla',
                  'lorem',
                  'ipsum',
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              DatePicker(
                onChanged: (s) {},
                type: DateTimeEnum.date,
                initialValue: '2024-03-22', //Optional
              ),
              const SizedBox(
                height: 10,
              ),
              DatePicker(
                onChanged: (s) {},
                type: DateTimeEnum.time,
                initialValue: '04:15 AM', //Optional
              ),
              const SizedBox(
                height: 10,
              ),
              DatePicker(
                onChanged: (s) {},
                type: DateTimeEnum.dateAndTime,
                initialValue: '2024-03-08 05:20 AM', // Optional
              ),
              const SizedBox(
                height: 10,
              ),
              CustomCheckbox(
                  label: 'Check box',
                  initialValue: true, // Optional
                  onChanged: (v) {
                    checked = v;
                  }),
              TextButton(
                onPressed: () {
                  showToast(
                    duration: 4, //Optional in seconds
                    context: context,
                    message: 'This is a toast example',
                  );
                },
                child: const Text('Toast'),
              ),
              TextButton(
                onPressed: () {
                  showOKDialog(
                    context: context,
                    message: 'Body Message',
                    title: 'Title',
                  );
                },
                child: const Text('OK Dialog'),
              ),
              TextButton(
                onPressed: () {
                  showAlertDialog(
                    onAgree: () {
                      print('Yes clicked');
                    },
                    context: context,
                    message: 'Body Message',
                    title: 'Title',
                  );
                },
                child: const Text('Alert Dialog'),
              ),
              SubmitButton(
                onPressed: () {},
                isExpanded: true,
                controller: controller,
                color: null, //Optional
                textColor: null, //Optional
                title: 'Submit', //sOptional
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      controller.reset();
                    },
                    child: const Text('Reset Submit'),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.success();
                    },
                    child: const Text('Success Submit'),
                  ),
                ],
              ),
              CancelButton(
                color: null, //Optional
                textColor: null, //Optional
                isExpanded: true, //Optional
                title: 'Cancel', // Optional
                onPressed: () {
                  print('pressed cancel');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormNavigation(
                onChanged: (value) {
                  print(value);
                },
                length: 5,
                width: null, // Optional
              ),
              const SizedBox(height: 20),
              DataGrid(
                data: data,
                allowFiltering: false, // Optional (Default false)
                fill: true, // Optional (Default false)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Customer> data = [
  Customer(id1: 0, id2: 42, id3: 53, name: 'Name 1', age: 33),
  Customer(id1: 1, id2: 33, id3: 63, name: 'Name 2', age: 36),
  Customer(id1: 2, id2: 16, id3: 64, name: 'Name 3', age: 23),
  Customer(id1: 3, id2: 25, id3: 22, name: 'Name 4', age: 15),
  Customer(id1: 4, id2: 31, id3: 64, name: 'Name 5', age: 24)
];

import 'package:flutter/material.dart';

class DeviceOptionSuffixIconWidget extends StatelessWidget {
  const DeviceOptionSuffixIconWidget({super.key,required this.moreFunction, required this.plusFunction});

  final Function() moreFunction;
  final Function() plusFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: moreFunction, icon: const Icon(Icons.more_horiz)),
        IconButton(onPressed: plusFunction, icon: const Icon(Icons.add)),
      ],);
  }
}

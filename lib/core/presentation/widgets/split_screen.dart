import 'package:flutter/material.dart';

class SplitScreenWidget extends StatelessWidget {
  final Widget child1;
  final Widget child2;
  final CrossAxisAlignment? alignment;
  const SplitScreenWidget({
    super.key,
    required this.child1,
    required this.child2,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: child1,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 1,
          child: child2,
        )
      ],
    );
  }
}

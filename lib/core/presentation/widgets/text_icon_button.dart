import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  final Color? textColor;
  final Color? iconColor;
  final double? fontSize;
  final double? iconSize;
  const TextIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.fontSize = 22,
    this.iconSize = 35,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

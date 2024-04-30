import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const Label({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 2,
      overflow: overflow,
      style: TextStyle(
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? Colors.black87,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color textColor;

  const Option({
    super.key,
    required this.title,
    this.bgColor = Colors.white,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}

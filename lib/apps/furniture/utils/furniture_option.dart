import 'package:flutter/material.dart';

class FurnitureOption extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color textColor;

  const FurnitureOption({
    super.key,
    required this.title,
    this.bgColor = const Color(0xFF9B9B9B),
    this.textColor = const Color(0xFF9B9B9B),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ClothCategoryCard extends StatelessWidget {
  final String title;
  final List<List<dynamic>> icon;
  final bool isSelected;

  const ClothCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isSelected ? const Color(0xFFF34000) : Colors.white;
    final Color textColor = isSelected ? Colors.white : const Color(0xFF191919);
    final Color borderColor = isSelected
        ? const Color(0xFFF34000)
        : const Color(0xFFF2F2F2);

    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: HugeIcon(icon: icon, color: bgColor, size: 14),
            )
          else
            HugeIcon(icon: icon, color: textColor, size: 18),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// "View All >" link used in section headers (Flash Sales, Popular Products).
class ViewAllButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ViewAllButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: const Row(
        children: [
          Text(
            'View All',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF8A00),
            ),
          ),
          SizedBox(width: 2),
          Icon(Icons.chevron_right, size: 16, color: Color(0xFFFF8A00)),
        ],
      ),
    );
  }
}

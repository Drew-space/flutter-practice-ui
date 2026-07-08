import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ClothEcomSearch extends StatelessWidget {
  const ClothEcomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              prefixIcon: SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                ),
              ),
              hintText: "Search for clothes...",
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Color(0xFFF34000),

            borderRadius: BorderRadius.circular(50),
          ),
          child: const HugeIcon(
            icon: HugeIcons.strokeRoundedFilterHorizontal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

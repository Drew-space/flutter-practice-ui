import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class GadgetSearch extends StatelessWidget {
  const GadgetSearch({super.key});

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
                    size: 25,
                  ),
                ),
              ),
              hintText: "Search for any products",
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEC7018), width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const HugeIcon(
            icon: HugeIcons.strokeRoundedFilterHorizontal,
            color: Color(0xFFFF8A00),
          ),
        ),
      ],
    );
  }
}

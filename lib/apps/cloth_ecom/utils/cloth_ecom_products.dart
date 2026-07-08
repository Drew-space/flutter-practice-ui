import 'package:flutter/material.dart';

class ClothEcomProducts extends StatelessWidget {
  const ClothEcomProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Recommended for you",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

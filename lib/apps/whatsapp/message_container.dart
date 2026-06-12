import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String time;

  const MessageContainer({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: NetworkImage(image)),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(message),
              ],
            ),
          ),

          Text(time),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String name;
  final String time;
  final String image;

  const StatusCard({
    super.key,
    required this.name,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      leading: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff25D366), width: 2.5),
        ),
        child: CircleAvatar(radius: 28, backgroundImage: NetworkImage(image)),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(time),
    );
  }
}

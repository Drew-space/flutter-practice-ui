import 'package:flutter/material.dart';
import 'package:practice_ui/apps/cloth_ecom/utils/cloth_ecom_notification.dart';
import 'package:practice_ui/apps/real-estate/utils/real_notificationIcon.dart';

class ClothEcomHeader extends StatelessWidget {
  const ClothEcomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/tracy.jpg"),
            ),

            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Hello Tracy",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),

        // Notification
        ClothEcomNotification(),
      ],
    );
  }
}

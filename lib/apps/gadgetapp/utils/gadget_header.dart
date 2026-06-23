import 'package:flutter/material.dart';
import 'package:practice_ui/apps/gadgetapp/utils/gadget_notification.dart';
import 'package:practice_ui/apps/real-estate/utils/real_notificationIcon.dart';

class GadgetHeader extends StatelessWidget {
  const GadgetHeader({super.key});

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
              backgroundImage: NetworkImage(
                "https://static.vecteezy.com/system/resources/thumbnails/044/245/716/small_2x/handsome-man-smiling-with-a-trendy-beard-and-hairstyle-png.png",
              ),
            ),

            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  "Ethan Walker",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),

        // Nofification
        GadgetNotification(),
      ],
    );
  }
}

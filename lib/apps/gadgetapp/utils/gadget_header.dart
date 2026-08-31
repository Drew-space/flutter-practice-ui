import 'package:flutter/material.dart';
import 'package:practice_ui/apps/gadgetapp/utils/gadget_notification.dart';
import 'package:practice_ui/apps/real-estate/utils/real_notificationIcon.dart';

class GadgetHeader extends StatelessWidget {
  const GadgetHeader({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

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
              backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=12"),
            ),

            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  _getGreeting(),
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

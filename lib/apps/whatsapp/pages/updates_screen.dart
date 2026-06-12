import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/whatsapp/utils/status.dart';
import 'package:practice_ui/apps/whatsapp/utils/status_header.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: "edit",
            backgroundColor: Colors.grey.shade200,
            elevation: 1,
            onPressed: () {},
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedPencilEdit01,
              size: 25,
              color: Colors.black,
            ),
            // child: Icon(Icons.edit, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: "camera",
            backgroundColor: const Color(0xff25D366),
            onPressed: () {},
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedCameraAdd01,
              color: Colors.white,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Updates"),
        actions: [
          HugeIcon(icon: HugeIcons.strokeRoundedSearch01),
          SizedBox(width: 10),
          HugeIcon(icon: HugeIcons.strokeRoundedMoreVertical),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusHeader(),

                Text(
                  "Recent updates",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),

                Status(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

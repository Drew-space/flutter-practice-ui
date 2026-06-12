import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/whatsapp/message_container.dart';

import 'package:practice_ui/apps/whatsapp/nav_control.dart';
import 'package:practice_ui/apps/whatsapp/option.dart';
import 'package:practice_ui/apps/whatsapp/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _options = ["All", "Unread 99+", "Favorites 12", "Groups 14", "+"];
  final chart = [
    {
      "name": "Jennifer ❤️",
      "message": "Morning",
      "time": "11:49 AM",
      "image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200",
    },
    {
      "name": "Software Engineers",
      "message": "Harry: And the words of the HOD...",
      "time": "8:24 AM",
      "image":
          "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=200",
    },
    {
      "name": "Future Software Engineers",
      "message": "Harry added +234 701 733 5496",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=200",
    },
    {
      "name": "Mark",
      "message": "How far?",
      "time": "11:49 AM",
      "image":
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
    },
    {
      "name": "emmzy",
      "message": "🎤 Voice message (0:15)",
      "time": "10:02 AM",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
    },
    {
      "name": "mercy",
      "message": "Have you submitted the assignment?",
      "time": "9:14 AM",
      "image":
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200",
    },
    {
      "name": "DSWE 312 Group",
      "message": "John: Exam starts by 9am tomorrow",
      "time": "8:01 AM",
      "image":
          "https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=200",
    },
    {
      "name": "Michael",
      "message": "Bro, check your email.",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1504593811423-6dd665756598?w=200",
    },
    {
      "name": "Family ❤️",
      "message": "Mum: Safe journey.",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1511895426328-dc8714191300?w=200",
    },
    {
      "name": "Sarah",
      "message": "😂😂😂",
      "time": "Monday",
      "image":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200",
    },
    {
      "name": "Flutter Devs",
      "message": "James: StatefulWidget vs Riverpod?",
      "time": "Monday",
      "image":
          "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=200",
    },
    {
      "name": "Daniel",
      "message": "See you in class.",
      "time": "Sunday",
      "image":
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
    },
    {
      "name": "Roommates",
      "message": "Who took the charger?",
      "time": "Sunday",
      "image":
          "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=200",
    },
    {
      "name": "Grace",
      "message": "Typing...",
      "time": "7:45 PM",
      "image":
          "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=200",
    },
    {
      "name": "Campus Market",
      "message": "Laptop available for sale.",
      "time": "7:02 PM",
      "image":
          "https://images.unsplash.com/photo-1521737604893-d14cc237f11d?w=200",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff25D366),
        onPressed: () {},
        child: HugeIcon(
          icon: HugeIcons.strokeRoundedBubbleChatAdd,
          color: Colors.white,
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "WhatsApp",
                    style: TextStyle(
                      color: Color(0xff25D366),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      HugeIcon(icon: HugeIcons.strokeRoundedCamera01),
                      SizedBox(width: 10),
                      HugeIcon(icon: HugeIcons.strokeRoundedMoreVertical),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(child: SearchBarContainer()),
            ),

            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),

                itemCount: _options.length,
                itemBuilder: (context, index) {
                  return Option(
                    title: _options[index],
                    bgColor: index == 0
                        ? const Color(0xffD8FDD2)
                        : Colors.white,
                    textColor: index == 0 ? Colors.green : Colors.black87,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: chart.length,
                itemBuilder: (context, index) {
                  final chats = chart[index];
                  return MessageContainer(
                    image: chats["image"]!,
                    name: chats["name"]!,
                    message: chats["message"]!,
                    time: chats["time"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

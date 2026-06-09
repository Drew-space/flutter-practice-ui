import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/widgets/option.dart';
import 'package:practice_ui/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final _options = ["All", "Unread 99+", "Favorites 12", "Groups 14", "+"];

  final chart = [
    {
      "name": "Jennifer",
      "message": "How far?",
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
      "name": "mark",
      "message": "How far",
      "time": "11:49 AM",
      "image":
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
    },
    {
      "name": "Prevail",
      "message": "Voice message (0:15)",
      "time": "10:02 AM",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
    },
    {
      "name": "Prevail",
      "message": "Voice message (0:15)",
      "time": "10:02 AM",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
    },
    {
      "name": "Prevail",
      "message": "Voice message (0:15)",
      "time": "10:02 AM",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
    },
    {
      "name": "Prevail",
      "message": "Voice message (0:15)",
      "time": "10:02 AM",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
    },
    {
      "name": "Prevail",
      "message": "Voice message (0:15)",
      "time": "10:02 AM",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 20),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _changeIndex,
          selectedItemColor: Color(0xff25D366),
          unselectedItemColor: Colors.black87,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: "Chats",
              icon: HugeIcon(icon: HugeIcons.strokeRoundedMessage01),
            ),
            BottomNavigationBarItem(
              label: "Updates",
              icon: HugeIcon(icon: HugeIcons.strokeRoundedSolarSystem01),
            ),
            BottomNavigationBarItem(
              label: "Communities",
              icon: HugeIcon(icon: HugeIcons.strokeRoundedUserGroup),
            ),
            BottomNavigationBarItem(
              label: "Calls",
              icon: HugeIcon(icon: HugeIcons.strokeRoundedCall),
            ),
          ],
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
          ],
        ),
      ),
    );
  }
}

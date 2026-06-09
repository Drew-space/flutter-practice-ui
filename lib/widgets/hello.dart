import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatelessWidget {
  const WhatsAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
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

    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff25D366),
        onPressed: () {},
        child: const Icon(Icons.add_comment, color: Colors.white),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: const Color(0xff25D366),
        unselectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chats",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: "Calls",
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "WhatsApp",
                    style: TextStyle(
                      color: Color(0xff25D366),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: 20),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Ask Meta AI or Search",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Filter Chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _chip(
                    text: "All",
                    bgColor: const Color(0xffD8FDD2),
                    textColor: Colors.green,
                  ),
                  _chip(text: "Unread 99+"),
                  _chip(text: "Favorites"),
                  _chip(text: "Groups"),
                  _chip(text: "+"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),

                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(chat["image"]!),
                    ),

                    title: Text(
                      chat["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        chat["message"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    trailing: Text(
                      chat["time"]!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _chip({
    required String text,
    Color bgColor = Colors.white,
    Color textColor = Colors.black87,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}

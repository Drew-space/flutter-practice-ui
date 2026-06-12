import 'package:flutter/material.dart';
import 'package:practice_ui/apps/whatsapp/utils/status_card.dart';

class Status extends StatelessWidget {
  const Status({super.key});
  static final updates = [
    {
      "name": "T-jay ❤️",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200",
    },
    {
      "name": "Jennifer",
      "time": "2:58 AM",
      "image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200",
    },
    {
      "name": "Judith",
      "time": "56 minutes ago",
      "image":
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200",
    },
    {
      "name": "Oghale",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200",
    },
    {
      "name": "Boy Alone💚",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200",
    },
    {
      "name": "Wisdompaul🚀",
      "time": "2:32 AM",
      "image":
          "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=200",
    },
    {
      "name": "Wisdom",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=200",
    },
    {
      "name": "Chidi 🔥",
      "time": "1:15 AM",
      "image":
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200",
    },
    {
      "name": "Amaka",
      "time": "3 hours ago",
      "image":
          "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=200",
    },
    {
      "name": "Kelechi",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1488161628813-04466f872be2?w=200",
    },
    {
      "name": "Uncle Emeka",
      "time": "4:00 AM",
      "image":
          "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=200",
    },
    {
      "name": "Tolu 😎",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=200",
    },
    {
      "name": "Blessing",
      "time": "30 minutes ago",
      "image":
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200",
    },
    {
      "name": "Emeka G",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?w=200",
    },
    {
      "name": "Sade 🌸",
      "time": "11:45 PM",
      "image":
          "https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?w=200",
    },
    {
      "name": "Femi",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1504257432389-52343af06ae3?w=200",
    },
    {
      "name": "Ngozi 💫",
      "time": "2 hours ago",
      "image":
          "https://images.unsplash.com/photo-1521252659862-eec69941b071?w=200",
    },
    {
      "name": "Dave",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=200",
    },
    {
      "name": "Chioma ✨",
      "time": "5 hours ago",
      "image":
          "https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?w=200",
    },
    {
      "name": "Segun",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1463453091185-61582044d556?w=200",
    },
    {
      "name": "Precious 🙏",
      "time": "12:01 AM",
      "image":
          "https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=200",
    },
    {
      "name": "Ikenna",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?w=200",
    },
    {
      "name": "Adaeze 💕",
      "time": "3:22 AM",
      "image":
          "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?w=200",
    },
    {
      "name": "Obinna",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=200",
    },
    {
      "name": "Funke 🌺",
      "time": "6 hours ago",
      "image":
          "https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?w=200",
    },
    {
      "name": "Rotimi",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?w=200",
    },
    {
      "name": "Chiamaka 🦋",
      "time": "1 hour ago",
      "image":
          "https://images.unsplash.com/photo-1513097633097-329a3a64e0d4?w=200",
    },
    {
      "name": "Damilola",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200",
    },
    {
      "name": "Nneka 🌟",
      "time": "4:44 AM",
      "image":
          "https://images.unsplash.com/photo-1506956191951-7a88da4435e5?w=200",
    },
    {
      "name": "Babatunde",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1560250097-0b93528c311a?w=200",
    },
    {
      "name": "Ifeoma 💎",
      "time": "45 minutes ago",
      "image":
          "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?w=200",
    },
    {
      "name": "Chukwuemeka",
      "time": "Yesterday",
      "image":
          "https://images.unsplash.com/photo-1542190891-2093d38760f2?w=200",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),
      itemCount: updates.length,
      itemBuilder: (context, index) {
        final user = updates[index];
        return StatusCard(
          name: user["name"]!,
          time: user["time"]!,
          image: user["image"]!,
        );
      },
    );
  }
}

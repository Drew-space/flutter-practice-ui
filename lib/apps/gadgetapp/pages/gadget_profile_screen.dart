import 'package:flutter/material.dart';

class GadgetProfileScreen extends StatelessWidget {
  const GadgetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          // ── AVATAR + NAME + EMAIL ─────────────────────────
          Center(
            child: Column(
              children: [
                // Profile picture pulled from a URL (placeholder here —
                // swap for the real logged-in user's photo URL later,
                // e.g. from Firebase Auth or your backend).
                CircleAvatar(
                  radius: 44,
                  backgroundColor: const Color(0xFFF5F5F5),
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/300?img=12',
                  ),
                  onBackgroundImageError: (_, __) {
                    // Falls back silently if the image fails to load —
                    // CircleAvatar just shows its background color.
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ethan walker',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  'drew@example.com',
                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                ),
                const SizedBox(height: 14),

                // Edit profile button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ── ACCOUNT SETTINGS LIST ─────────────────────────
          _ProfileSectionLabel(label: 'Account'),
          _ProfileTile(
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
            onTap: () {},
          ),
          _ProfileTile(
            icon: Icons.location_on_outlined,
            title: 'Shipping Addresses',
            onTap: () {},
          ),
          _ProfileTile(
            icon: Icons.payment_outlined,
            title: 'Payment Methods',
            onTap: () {},
          ),

          const SizedBox(height: 20),

          _ProfileSectionLabel(label: 'Preferences'),
          _ProfileTile(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
            onTap: () {},
          ),
          _ProfileTile(
            icon: Icons.language_outlined,
            title: 'Language',
            trailingText: 'English',
            onTap: () {},
          ),

          const SizedBox(height: 20),

          _ProfileSectionLabel(label: 'Support'),
          _ProfileTile(
            icon: Icons.help_outline_rounded,
            title: 'Help Center',
            onTap: () {},
          ),
          _ProfileTile(
            icon: Icons.logout_rounded,
            title: 'Log Out',
            titleColor: const Color(0xFFE0473E),
            iconColor: const Color(0xFFE0473E),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION LABEL (small grey heading above a group of tiles)
// ============================================================

class _ProfileSectionLabel extends StatelessWidget {
  final String label;

  const _ProfileSectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey[500],
        ),
      ),
    );
  }
}

// ============================================================
// PROFILE TILE (one tappable row — icon, title, chevron)
// ============================================================

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final Color? titleColor;
  final Color? iconColor;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingText,
    this.titleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor ?? Colors.black87),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: titleColor ?? Colors.black,
                ),
              ),
            ),
            if (trailingText != null) ...[
              Text(
                trailingText!,
                style: TextStyle(fontSize: 13, color: Colors.grey[500]),
              ),
              const SizedBox(width: 6),
            ],
            const Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

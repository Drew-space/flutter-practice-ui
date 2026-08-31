import 'package:flutter/material.dart';

/// A small square button used for the "+" and "-" quantity controls.
///
/// This is a SEPARATE widget (instead of writing the button code twice)
/// so we don't repeat ourselves — one for decrease (-), one for increase (+),
/// both using this SAME widget, just with different icon and onTap.
class StepperButton extends StatelessWidget {
  // The icon to show inside the button (e.g. Icons.add or Icons.remove)
  final IconData icon;

  // What happens when the button is tapped — passed in from OUTSIDE
  // this widget, so this widget doesn't need to know WHAT happens,
  // just THAT something should happen on tap.
  final VoidCallback onTap;

  const StepperButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // InkWell gives us the tap ripple effect + lets us detect taps
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: const Color(0xFFEC7018), // purple-blue background
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}

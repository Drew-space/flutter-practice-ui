import 'package:flutter/material.dart';

/// A simple row that shows a label on the left and a dollar amount
/// on the right — e.g. "Total    $200".
///
/// Set isTotal to true if this row should look bolder/bigger
/// (used for the final Total line, different from a normal line item).
class SummaryRow extends StatelessWidget {
  final String label; // e.g. "Total"
  final double value; // e.g. 200.0
  final bool isTotal; // true = make it look bold/emphasized

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    // Text style for the LEFT side (the label, e.g. "Total")
    final labelStyle = TextStyle(
      fontSize: isTotal ? 15 : 14,
      fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
      color: isTotal ? Colors.black : Colors.grey[600],
    );

    // Text style for the RIGHT side (the price, e.g. "$200")
    final valueStyle = TextStyle(
      fontSize: isTotal ? 16 : 14,
      fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
      color: Colors.black,
    );

    return Row(
      // Pushes the label to the far left and the value to the far right
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        Text('\$${value.toStringAsFixed(0)}', style: valueStyle),
      ],
    );
  }
}

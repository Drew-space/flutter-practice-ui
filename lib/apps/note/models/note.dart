import 'package:flutter/material.dart';

class Note {
  final String id;
  final String title;
  final String content;
  final String? category;
  final DateTime date;
  final Color color;
  final String? imageUrl;
  final bool isPinned;
  final bool isLocked;
  final bool isChecklist;
  final List<ChecklistItem>? checklistItems;

  Note({
    required this.id,
    required this.title,
    required this.content,
    this.category,
    required this.date,
    required this.color,
    this.imageUrl,
    this.isPinned = false,
    this.isLocked = false,
    this.isChecklist = false,
    this.checklistItems,
  });
}

class ChecklistItem {
  final String text;
  final bool isDone;

  ChecklistItem({required this.text, this.isDone = false});
}

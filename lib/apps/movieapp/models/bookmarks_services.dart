import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarksService {
  static final BookmarksService _instance = BookmarksService._internal();
  factory BookmarksService() => _instance;
  BookmarksService._internal();

  /// 👇 Getter — fetches the already-opened box from main.dart
  /// No late, no init(), no crash
  Box<String> get _box => Hive.box<String>('movieBookmarks');

  Future<void> addBookmark(Map<String, dynamic> movie) async {
    final key =
        movie['id']?.toString() ??
        DateTime.now().millisecondsSinceEpoch.toString();
    final jsonString = jsonEncode(movie);
    await _box.put(key, jsonString);
  }

  Future<void> removeBookmark(String id) async {
    await _box.delete(id);
  }

  Future<bool> toggleBookmark(Map<String, dynamic> movie) async {
    final id = movie['id']?.toString();
    if (id == null) return false;

    if (isBookmarked(id)) {
      await removeBookmark(id);
      return false;
    } else {
      await addBookmark(movie);
      return true;
    }
  }

  bool isBookmarked(String id) {
    return _box.containsKey(id);
  }

  List<Map<String, dynamic>> getAllBookmarks() {
    return _box.values.map((jsonString) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }).toList();
  }

  Future<void> clearAll() async {
    await _box.clear();
  }

  Stream<BoxEvent> get watchStream => _box.watch();
}

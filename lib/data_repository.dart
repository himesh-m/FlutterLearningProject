import 'dart:convert';
import 'package:http/http.dart' as http;
import 'entry_model.dart';

class DataRepository {
  Future<List<Entry>?> fetchEntries() async {
    try {
      final response = await http.get(Uri.parse('https://api.publicapis.org/entries'));
      final data = jsonDecode(response.body);
      final entries = List<Entry>.from(data['entries'].map((entry) => Entry.fromJson(entry)));
      return entries;
    } catch (e) {
      return null;
    }
  }
}
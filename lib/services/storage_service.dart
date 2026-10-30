import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// Simple JSON file helper for new modules. Existing app persistence remains
/// managed by LocalStore in main.dart to avoid migrating user data unexpectedly.
class StorageService {
  const StorageService();

  Future<File> file(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$filename');
  }

  Future<Map<String, dynamic>?> readJson(String filename) async {
    final target = await file(filename);
    if (!await target.exists()) return null;
    final decoded = jsonDecode(await target.readAsString());
    if (decoded is! Map) throw const FormatException('ملف البيانات ليس بصيغة JSON صحيحة');
    return Map<String, dynamic>.from(decoded);
  }

  Future<void> writeJson(String filename, Map<String, dynamic> data) async {
    final target = await file(filename);
    final temporary = File('${target.path}.tmp');
    await temporary.writeAsString(const JsonEncoder.withIndent('  ').convert(data), flush: true);
    await temporary.rename(target.path);
  }
}

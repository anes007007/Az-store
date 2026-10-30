import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Backup helpers for a JSON snapshot. The app's existing import/export UI can
/// continue using its current flow; this service is available for future refactor.
class BackupService {
  const BackupService();

  Future<File> createSnapshot(Map<String, dynamic> data) async {
    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final target = File('${directory.path}/AZ_Store_backup_$timestamp.json');
    await target.writeAsString(const JsonEncoder.withIndent('  ').convert(data), flush: true);
    return target;
  }

  Future<void> shareSnapshot(File file) async {
    await SharePlus.instance.share(ShareParams(files: [XFile(file.path)], text: 'نسخة احتياطية من AZ Store'));
  }

  Future<String?> pickBackupPath() async {
    final result = await FilePicker().pickFiles(type: FileType.custom, allowedExtensions: ['json'], withData: false);
    return result?.files.single.path;
  }
}

import 'package:path_provider/path_provider.dart';
import 'package:isar_community/isar.dart';
import 'package:wmm/models/record.dart';

class IsarService {
  Isar? _isar;
  static final IsarService instance = IsarService();

  Future<Isar> _getDb() async {
    // dart level check
    if (_isar != null) return _isar!;

    // Safety device level check
    _isar = Isar.getInstance();

    if (_isar == null) {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open([RecordSchema], directory: dir.path);
    }

    return _isar!;
  }

  Future<void> addAndUpdateRecord(Record record) async {
    final db = await _getDb();
    await db.writeTxn(() async {
      db.records.put(record);
    });
  }

  Future<void> deleteRecord(Record record) async {
    final db = await _getDb();
    await db.writeTxn(() async {
      db.records.delete(record.id);
    });
  }
}

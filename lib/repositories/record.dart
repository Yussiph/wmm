import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:wmm/models/record.dart';

late Isar isar;

Future<void> startIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open([RecordSchema], directory: dir.path);
}

Future<void> addAndUpdateRecord(Record record) async {
  if (isar.isOpen) {
    await isar.writeTxn(() async {
      isar.records.put(record);
    });
  }
}

Future<void> deleteRecord(Record record) async {
    if (isar.isOpen) {
        await isar.writeTxn( () async {
            isar.records.delete(record.id);
          });
      }
  }

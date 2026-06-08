import 'package:isar/isar.dart';
import 'package:wmm/models/category.dart';

part 'record.g.dart';

enum Type { income, expense }

@collection
class Record {
    Id id = Isar.autoIncrement;

    late double amount;
    String? note;
    @Enumerated(EnumType.name)
    late Type type;
    @Enumerated(EnumType.name)
    late List<Category> categories;
    late DateTime time;
    
  }

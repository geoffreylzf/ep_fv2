import 'package:intl/intl.dart';
import 'package:moor/moor.dart';

@DataClassName("Log")
class LogTb extends Table {
  String get tableName => 'log';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get type => text()();

  TextColumn get remark => text()();

  TextColumn get timestamp => text().clientDefault(
        () => DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
  )();
}

import 'package:moor/moor.dart';

@DataClassName("BroFa2Routine")
class BroFa2RoutineTb extends Table {
  String get tableName => 'bro_fa2_routine';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get formula => text().nullable()();

  IntColumn get order => integer()();
}

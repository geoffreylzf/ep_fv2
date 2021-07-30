import 'package:moor/moor.dart';

@DataClassName("BroFa2Ma")
class BroFa2MaTb extends Table {
  String get tableName => 'bro_fa2_ma';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get order => integer()();
}

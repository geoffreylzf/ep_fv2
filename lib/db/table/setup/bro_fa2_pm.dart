import 'package:moor/moor.dart';

@DataClassName("BroFa2Pm")
class BroFa2PmTb extends Table {
  String get tableName => 'bro_fa2_pm';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  @JsonKey('is_allow_photo')
  BoolColumn get isAllowPhoto => boolean()();

  IntColumn get order => integer()();
}

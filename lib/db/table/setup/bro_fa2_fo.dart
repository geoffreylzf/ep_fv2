import 'package:moor/moor.dart';

@DataClassName("BroFa2Fo")
class BroFa2FoTb extends Table {
  String get tableName => 'bro_fa2_fo';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  @JsonKey('is_number')
  BoolColumn get isNumber => boolean()();

  @JsonKey('is_formula')
  BoolColumn get isFormula => boolean()();

  TextColumn get formula => text().nullable()();

  @JsonKey('is_selection')
  BoolColumn get isSelection => boolean()();

  @JsonKey('is_allow_photo')
  BoolColumn get isAllowPhoto => boolean()();

  IntColumn get order => integer()();
}
